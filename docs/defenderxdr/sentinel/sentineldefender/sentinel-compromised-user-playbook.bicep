// ============================================================
// Sentinel Compromised User Response Playbook
// SecuringM365.com | Anto Porter
//
// Deploys a Logic App playbook using the Microsoft Sentinel
// incident trigger model for use in the Unified Defender portal.
//
// Flow:
//   1. Incident trigger (from automation rule)
//   2. Teams notification to SOC channel
//   3. Approval email to designated admins (Block / Ignore)
//   4. If Block: disable user in Entra ID, add incident comment
//   5. If Ignore: close incident, add incident comment
//
// Authentication:
//   - Logic App uses system-assigned managed identity
//   - Post-deployment role assignments required (see README)
//
// Post-deployment steps required (see README):
//   1. Assign Microsoft Sentinel Responder to managed identity
//   2. Grant Sentinel service account Automation Contributor
//      on this resource group via Defender portal Automation settings
//   3. Assign User.EnableDisableAccount.All Graph app role
//   4. Authorise the Office 365 API connection
//   5. Create automation rule in Defender portal
// ============================================================

@description('Name of the Logic App playbook resource.')
@minLength(1)
@maxLength(60)
param playbookName string = 'Sentinel-CompromisedUser-Response'

@description('Azure region for all resources. Defaults to resource group location.')
param location string = resourceGroup().location

@description('Name of the Microsoft Sentinel workspace. Used for post-deployment role assignment reference.')
@minLength(1)
param sentinelWorkspaceName string

@description('Resource group containing the Microsoft Sentinel workspace.')
@minLength(1)
param sentinelWorkspaceResourceGroup string = resourceGroup().name

@description('Subscription ID containing the Microsoft Sentinel workspace.')
@minLength(36)
@maxLength(36)
param sentinelSubscriptionId string = subscription().subscriptionId

@description('Email address to send approval requests to. Can be a distribution group.')
@minLength(3)
param approverEmailAddress string

@description('Microsoft Teams channel webhook URL for SOC notifications.')
@secure()
@minLength(20)
param teamsWebhookUrl string

@description('Display name shown in Teams notifications and approval emails.')
@minLength(1)
@maxLength(120)
param playbookDisplayName string = 'Sentinel Compromised User Response'

@description('Tags to apply to all deployed resources.')
param resourceTags object = {
  solution: 'Sentinel-SOAR'
  managedBy: 'SecuringM365'
  article: 'Part4-AutomationPlaybooksSoar'
}

// ============================================================
// API Connections
// ============================================================

// Microsoft Sentinel connector with managed identity authentication.
// Managed identity is applied at workflow runtime via
// $connections.azuresentinel.connectionProperties.authentication.
resource sentinelApiConnection 'Microsoft.Web/connections@2016-06-01' = {
  name: '${playbookName}-sentinel-connection'
  location: location
  tags: resourceTags
  properties: {
    displayName: '${playbookName}-sentinel'
    customParameterValues: {}
    api: {
      id: subscriptionResourceId('Microsoft.Web/locations/managedApis', location, 'azuresentinel')
    }
  }
}

// Office 365 connector for approval email.
// IMPORTANT: Requires manual OAuth authorisation post-deployment.
// See README Step 4.
resource office365ApiConnection 'Microsoft.Web/connections@2016-06-01' = {
  name: '${playbookName}-office365-connection'
  location: location
  tags: resourceTags
  properties: {
    displayName: '${playbookName}-office365'
    customParameterValues: {}
    api: {
      id: subscriptionResourceId('Microsoft.Web/locations/managedApis', location, 'office365')
    }
  }
}

// ============================================================
// Logic App (Consumption) with system-assigned managed identity
// ============================================================

resource logicApp 'Microsoft.Logic/workflows@2019-05-01' = {
  name: playbookName
  location: location
  tags: resourceTags
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    state: 'Enabled'
    definition: {
      '$schema': 'https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#'
      contentVersion: '1.0.0.0'
      parameters: {
        '$connections': {
          defaultValue: {}
          type: 'Object'
        }
        approverEmail: {
          defaultValue: approverEmailAddress
          type: 'String'
        }
        teamsWebhook: {
          defaultValue: teamsWebhookUrl
          type: 'String'
        }
        playbookDisplayName: {
          defaultValue: playbookDisplayName
          type: 'String'
        }
      }
      triggers: {
        Microsoft_Sentinel_incident: {
          type: 'ApiConnectionWebhook'
          inputs: {
            host: {
              connection: {
                name: '@parameters(\'$connections\')[\'azuresentinel\'][\'connectionId\']'
              }
            }
            body: {
              callback_url: '@{listCallbackUrl()}'
            }
            path: '/incident-creation'
          }
        }
      }
      actions: {

        // Step 1: Get account entities from the incident
        Entities_Get_Accounts: {
          runAfter: {}
          type: 'ApiConnection'
          inputs: {
            host: {
              connection: {
                name: '@parameters(\'$connections\')[\'azuresentinel\'][\'connectionId\']'
              }
            }
            method: 'post'
            path: '/entities/account'
            body: '@triggerBody()?[\'object\']?[\'properties\']?[\'relatedEntities\']'
          }
        }

        // Step 2: Notify SOC via Teams webhook
        Notify_SOC_Teams: {
          runAfter: {
            Entities_Get_Accounts: [
              'Succeeded'
            ]
          }
          type: 'Http'
          inputs: {
            method: 'POST'
            uri: '@parameters(\'teamsWebhook\')'
            headers: {
              'Content-Type': 'application/json'
            }
            body: {
              '@type': 'MessageCard'
              '@context': 'http://schema.org/extensions'
              themeColor: 'FF0000'
              summary: 'Compromised User Incident'
              sections: [
                {
                  activityTitle: '⚠️ Compromised User Incident Detected'
                  activitySubtitle: '@{triggerBody()?[\'object\']?[\'properties\']?[\'title\']}'
                  facts: [
                    {
                      name: 'Severity'
                      value: '@{triggerBody()?[\'object\']?[\'properties\']?[\'severity\']}'
                    }
                    {
                      name: 'Incident Number'
                      value: '@{triggerBody()?[\'object\']?[\'properties\']?[\'incidentNumber\']}'
                    }
                    {
                      name: 'Status'
                      value: '@{triggerBody()?[\'object\']?[\'properties\']?[\'status\']}'
                    }
                    {
                      name: 'Description'
                      value: '@{triggerBody()?[\'object\']?[\'properties\']?[\'description\']}'
                    }
                  ]
                  markdown: true
                }
              ]
            }
          }
        }

        // Step 3: Send approval email with Block / Ignore options
        Send_Approval_Email: {
          runAfter: {
            Notify_SOC_Teams: [
              'Succeeded'
              'Failed'
            ]
          }
          type: 'ApiConnection'
          inputs: {
            host: {
              connection: {
                name: '@parameters(\'$connections\')[\'office365\'][\'connectionId\']'
              }
            }
            method: 'post'
            path: '/approvalmail/$subscriptions'
            body: {
              To: '@parameters(\'approverEmail\')'
              Subject: '[ACTION REQUIRED] Compromised User: @{triggerBody()?[\'object\']?[\'properties\']?[\'title\']}'
              Options: 'Block user, Ignore'
              Body: '<h2>Compromised User Incident Requires Your Decision</h2><p><strong>Incident Title:</strong> @{triggerBody()?[\'object\']?[\'properties\']?[\'title\']}</p><p><strong>Severity:</strong> @{triggerBody()?[\'object\']?[\'properties\']?[\'severity\']}</p><p><strong>Description:</strong> @{triggerBody()?[\'object\']?[\'properties\']?[\'description\']}</p><p>Select <strong>Block user</strong> to disable the account in Microsoft Entra ID, or <strong>Ignore</strong> to close the incident without action.</p>'
              Importance: 'High'
            }
          }
        }

        // Step 4: Branch on approval response
        Check_Approval_Response: {
          runAfter: {
            Send_Approval_Email: [
              'Succeeded'
            ]
          }
          type: 'If'
          expression: {
            and: [
              {
                equals: [
                  '@body(\'Send_Approval_Email\')?[\'SelectedOption\']'
                  'Block user'
                ]
              }
            ]
          }

          // Branch TRUE: Block user
          actions: {
            For_Each_Account: {
              runAfter: {}
              type: 'Foreach'
              foreach: '@coalesce(body(\'Entities_Get_Accounts\')?[\'Accounts\'], createArray())'
              actions: {
                Disable_Entra_Account: {
                  runAfter: {}
                  type: 'Http'
                  inputs: {
                    method: 'PATCH'
                    uri: 'https://graph.microsoft.com/v1.0/users/@{coalesce(items(\'For_Each_Account\')?[\'AadUserId\'], items(\'For_Each_Account\')?[\'Name\'])}'
                    authentication: {
                      type: 'ManagedServiceIdentity'
                      audience: 'https://graph.microsoft.com'
                    }
                    headers: {
                      'Content-Type': 'application/json'
                    }
                    body: {
                      accountEnabled: false
                    }
                  }
                }
              }
            }
            Add_Block_Comment: {
              runAfter: {
                For_Each_Account: [
                  'Succeeded'
                  'Failed'
                ]
              }
              type: 'ApiConnection'
              inputs: {
                host: {
                  connection: {
                    name: '@parameters(\'$connections\')[\'azuresentinel\'][\'connectionId\']'
                  }
                }
                method: 'post'
                path: '/Incidents/Comment'
                body: {
                  incidentArmId: '@triggerBody()?[\'object\']?[\'id\']'
                  message: 'Automated response: User account(s) disabled in Microsoft Entra ID following admin approval. Playbook: @{parameters(\'playbookDisplayName\')}. Approved by: @{body(\'Send_Approval_Email\')?[\'RespondedBy\']}.'
                }
              }
            }
          }

          // Branch FALSE: Ignore
          else: {
            actions: {
              Close_Incident: {
                runAfter: {}
                type: 'ApiConnection'
                inputs: {
                  host: {
                    connection: {
                      name: '@parameters(\'$connections\')[\'azuresentinel\'][\'connectionId\']'
                    }
                  }
                  method: 'put'
                  path: '/Incidents'
                  body: {
                    incidentArmId: '@triggerBody()?[\'object\']?[\'id\']'
                    status: 'Closed'
                    classification: 'Undetermined'
                    classificationComment: 'Closed by automated playbook following admin review. No remediation action taken.'
                  }
                }
              }
              Add_Ignore_Comment: {
                runAfter: {
                  Close_Incident: [
                    'Succeeded'
                  ]
                }
                type: 'ApiConnection'
                inputs: {
                  host: {
                    connection: {
                      name: '@parameters(\'$connections\')[\'azuresentinel\'][\'connectionId\']'
                    }
                  }
                  method: 'post'
                  path: '/Incidents/Comment'
                  body: {
                    incidentArmId: '@triggerBody()?[\'object\']?[\'id\']'
                    message: 'Automated response: Incident closed following admin review. No action taken. Playbook: @{parameters(\'playbookDisplayName\')}. Reviewed by: @{body(\'Send_Approval_Email\')?[\'RespondedBy\']}.'
                  }
                }
              }
            }
          }
        }
      }
    }
    parameters: {
      '$connections': {
        value: {
          azuresentinel: {
            connectionId: sentinelApiConnection.id
            connectionName: sentinelApiConnection.name
            id: subscriptionResourceId('Microsoft.Web/locations/managedApis', location, 'azuresentinel')
            connectionProperties: {
              authentication: {
                type: 'ManagedServiceIdentity'
              }
            }
          }
          office365: {
            connectionId: office365ApiConnection.id
            connectionName: office365ApiConnection.name
            id: subscriptionResourceId('Microsoft.Web/locations/managedApis', location, 'office365')
          }
        }
      }
    }
  }
}

// ============================================================
// Outputs
// ============================================================

@description('Resource ID of the Microsoft Sentinel workspace provided by parameters.')
output sentinelWorkspaceResourceId string = resourceId(
  sentinelSubscriptionId,
  sentinelWorkspaceResourceGroup,
  'Microsoft.OperationalInsights/workspaces',
  sentinelWorkspaceName
)

@description('Resource ID of the deployed Logic App.')
output logicAppResourceId string = logicApp.id

@description('Principal ID of the Logic App system-assigned managed identity. Use this for role assignments in the README post-deployment steps.')
output managedIdentityPrincipalId string = logicApp.identity.principalId

@description('Name of the Sentinel API connection resource.')
output sentinelConnectionName string = sentinelApiConnection.name

@description('Name of the Office 365 API connection resource.')
output office365ConnectionName string = office365ApiConnection.name
