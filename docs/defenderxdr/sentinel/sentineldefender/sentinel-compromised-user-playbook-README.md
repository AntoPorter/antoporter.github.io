# Sentinel Compromised User Response Playbook

A deployable Bicep template implementing a compromised user response playbook for Microsoft Sentinel in the Unified Defender portal.

Built by [Anto Porter](https://securingm365.com) as a companion resource to the article series *Sentinel to Defender Portal: A Practitioner's Migration Guide*.

---

## What This Deploys

A Consumption Logic App using the Microsoft Sentinel incident trigger model, with the following response flow:

1. Incident is created in Sentinel and an automation rule calls this playbook
	
2. SOC is notified via Microsoft Teams webhook
	
3. Approval email is sent to designated administrators with **Block user** and **Ignore** options
	
4. Playbook waits for admin response
	
5. **If Block user:** all account entities in the incident are disabled in Microsoft Entra ID via Microsoft Graph API, and a comment is added to the incident
	
6. **If Ignore:** the incident is closed in Sentinel and a comment recording the decision is added
	

Authentication uses a system-assigned managed identity on the Logic App. No stored credentials are required for the Sentinel connector.

---

## Prerequisites

Before deploying, confirm the following are in place.

**Azure permissions required for deployment:**

- Contributor on the target resource group (to deploy Logic App and API connections)
	
- Owner or User Access Administrator on the resource group (to complete post-deployment role assignments)
	

**Microsoft Sentinel:**

- A Sentinel workspace onboarded to the Microsoft Defender portal
	
- Provide `sentinelWorkspaceName` (and optionally workspace resource group/subscription parameters) so post-deployment role assignment can target the correct workspace
	

**Microsoft Graph permissions required post-deployment:**

- The Logic App's managed identity needs `User.EnableDisableAccount.All` (or `User.ReadWrite.All`) on the Microsoft Graph API to disable Entra ID accounts
	
- This is a privileged permission. Assign it to the managed identity via an admin-consented app role assignment, not a delegated permission
	

**Office 365 connection:**

- The Office 365 API connection is used to send approval emails. After deployment it requires an authenticated account with a valid Exchange Online mailbox to authorise the connection
	
- If your organisation restricts OAuth connections, pre-authorise the connection before deploying
	

---

## Parameters

| Parameter | Required | Default | Description |
|-----------|----------|---------|-------------|
| `playbookName` | No | `Sentinel-CompromisedUser-Response` | Name of the Logic App resource |
| `location` | No | Resource group location | Azure region for all resources |
| `sentinelWorkspaceName` | **Yes** | — | Name of the Sentinel workspace |
| `sentinelWorkspaceResourceGroup` | No | Deployment resource group | Resource group containing the workspace |
| `sentinelSubscriptionId` | No | Deployment subscription | Subscription containing the workspace |
| `approverEmailAddress` | **Yes** | — | Email address for approval requests. Can be a distribution group |
| `teamsWebhookUrl` | **Yes** | — | Incoming webhook URL for the target Teams channel |
| `playbookDisplayName` | No | `Sentinel Compromised User Response` | Display name in notifications and comments |
| `resourceTags` | No | See template | Tags applied to all deployed resources |

---

## Deployment

### Option 1: Azure CLI

```bash
az deployment group create \
  --resource-group <your-resource-group> \
  --template-file sentinel-compromised-user-playbook.bicep \
  --parameters \
      sentinelWorkspaceName=<your-workspace-name> \
      approverEmailAddress=<approver@yourdomain.com> \
      teamsWebhookUrl=<your-teams-webhook-url>
```

### Option 2: Azure PowerShell

```powershell
New-AzResourceGroupDeployment `
  -ResourceGroupName "<your-resource-group>" `
  -TemplateFile "sentinel-compromised-user-playbook.bicep" `
  -sentinelWorkspaceName "<your-workspace-name>" `
  -approverEmailAddress "<approver@yourdomain.com>" `
  -teamsWebhookUrl "<your-teams-webhook-url>"
```

### Option 3: Azure Portal (What-If first)

```bash
az deployment group what-if \
  --resource-group <your-resource-group> \
  --template-file sentinel-compromised-user-playbook.bicep \
  --parameters \
      sentinelWorkspaceName=<your-workspace-name> \
      approverEmailAddress=<approver@yourdomain.com> \
      teamsWebhookUrl=<your-teams-webhook-url>
```

Review the what-if output, then remove `what-if` from the command to deploy.

---

## Post-Deployment Steps

These steps must be completed before the playbook can run. None are automated by the Bicep template because they require permissions beyond the deployment scope.

### Step 1: Assign Microsoft Sentinel Responder to the managed identity

The Logic App's managed identity needs access to the Sentinel workspace to read incidents and add comments.

```bash
# Get the managed identity principal ID from the deployment output
PRINCIPAL_ID=$(az deployment group show \
  --resource-group <your-resource-group> \
  --name sentinel-compromised-user-playbook \
  --query properties.outputs.managedIdentityPrincipalId.value \
  --output tsv)

# Get the Sentinel workspace resource ID from deployment output
WORKSPACE_ID=$(az deployment group show \
  --resource-group <your-resource-group> \
  --name sentinel-compromised-user-playbook \
  --query properties.outputs.sentinelWorkspaceResourceId.value \
  --output tsv)

# Assign Microsoft Sentinel Responder
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Microsoft Sentinel Responder" \
  --scope $WORKSPACE_ID
```

### Step 2: Grant Microsoft Sentinel permission to run playbooks on the resource group

Microsoft Sentinel uses its own service account to invoke playbooks from automation rules. This service account must have the Automation Contributor role on the resource group containing the playbook.

In the Microsoft Defender portal:

1. Go to **Microsoft Sentinel > Configuration > Automation**
	
2. Select **Playbook permissions** from the top menu
	
3. Select **Configure permissions**
	
4. Mark the checkbox for the resource group containing this playbook
	
5. Select **Apply**
	

Alternatively, use the Azure portal to assign the **Microsoft Sentinel Automation Contributor** role to the Microsoft Sentinel service principal (`Azure Security Insights`) on the playbook resource group.

### Step 3: Assign Microsoft Graph User.EnableDisableAccount.All to the managed identity

The playbook disables user accounts via Microsoft Graph. This requires an application role assignment to the managed identity.

```powershell
# Requires Microsoft.Graph PowerShell module
Connect-MgGraph -Scopes "AppRoleAssignment.ReadWrite.All","Application.Read.All"

# Get the managed identity object ID
$ManagedIdentityId = "<principal-id-from-deployment-output>"

# Get the Microsoft Graph service principal
$GraphSP = Get-MgServicePrincipal -Filter "appId eq '00000003-0000-0000-c000-000000000000'"

# Get the app role for User.EnableDisableAccount.All
$AppRole = $GraphSP.AppRoles | Where-Object { $_.Value -eq "User.EnableDisableAccount.All" }

# Assign the role
New-MgServicePrincipalAppRoleAssignment `
  -ServicePrincipalId $ManagedIdentityId `
  -PrincipalId $ManagedIdentityId `
  -ResourceId $GraphSP.Id `
  -AppRoleId $AppRole.Id
```

### Step 4: Authorise the Office 365 API connection

The Office 365 connection requires an authenticated account to send approval emails.

1. In the Azure portal, navigate to the deployed Office 365 API connection resource
	
2. Select **Edit API connection**
	
3. Select **Authorise** and sign in with a mailbox account that has Exchange Online access
	
4. Select **Save**
	

### Step 5: Create the automation rule in the Defender portal

The playbook will not fire until an automation rule calls it.

1. In the Microsoft Defender portal, go to **Microsoft Sentinel > Configuration > Automation**
	
2. Select **Create > Automation rule**
	
3. Set the trigger to **When incident is created**
	
4. Add a condition: **Analytics rule name** contains the name of the analytics rule(s) that detect compromised users
	
5. Add an action: **Run playbook** and select `Sentinel-CompromisedUser-Response`
	
6. Set an appropriate order and expiration if needed
	
7. Select **Apply**
	

---

## Teams Webhook Setup

> **Note:** Microsoft is deprecating legacy incoming webhooks in Teams in favour of the Workflows-based webhook connector. If your Teams environment shows only the Workflows option, create a Power Automate flow with the "Post to a channel when a webhook request is received" template and use the generated URL as the `teamsWebhookUrl` parameter instead.


If you do not already have an incoming webhook configured in your SOC Teams channel:

1. In Teams, navigate to the channel you want to use
	
2. Select **...** next to the channel name > **Connectors**
	
3. Search for **Incoming Webhook** and select **Configure**
	
4. Provide a name (e.g., `Sentinel Alerts`) and optionally upload an image
	
5. Copy the webhook URL and use it as the `teamsWebhookUrl` parameter
	

---

## Known Limitations

**July 2026 automatic redirect:** Starting July 2026, any remaining customers using Microsoft Sentinel in the Azure portal will be automatically redirected to the Defender portal. If you are deploying this playbook before that date and have not yet onboarded to the Defender portal, you will need to ensure the automation rule created in Step 5 of the README is created in the Defender portal after onboarding.

**Graph permission scope:** `User.EnableDisableAccount.All` is a privileged permission. In environments where least-privilege requirements prevent broad user write access for managed identities, consider scoping the managed identity to a specific administrative unit in Entra ID containing only the accounts relevant to your SOC response scope.

**Office 365 connection:** The approval email action uses a delegated OAuth connection. If the authorising account's password expires or MFA prompt is not completed, the connection will fail. Monitor connection health in the Logic App run history.

**Approval timeout:** The playbook waits indefinitely for approval by default. The Logic App does not have a timeout configured on the approval action. If your operational requirements require a default action after a set period (for example, auto-close after 24 hours), add a timeout to the approval action in the Logic App designer.

**Single workspace scope:** The Bicep template deploys to a single resource group and connects to a single Sentinel workspace. For multi-workspace MSSP deployments, deploy one instance per customer resource group or adapt the template to accept workspace parameters dynamically.

---

## Extending This Template

This template implements the core pattern: incident trigger, notification, approval gate, conditional response. Common extensions include:

- Adding a ServiceNow ticket creation action before the approval step
	
- Adding a firewall IP block action in the Block branch alongside the account disable
	
- Adding an Azure AD audit log query to include recent sign-in evidence in the approval email
	
- Replacing the Office 365 approval email with an Adaptive Card sent directly to Teams
	

---

## Resources

- [Microsoft Sentinel automation documentation](https://learn.microsoft.com/en-us/azure/sentinel/automation/automation)

- [Automate threat response with playbooks](https://learn.microsoft.com/en-us/azure/sentinel/automation/automate-responses-with-playbooks)

- [Authenticate playbooks to Microsoft Sentinel](https://learn.microsoft.com/en-us/azure/sentinel/automation/authenticate-playbooks-to-sentinel)

- [Supported triggers and actions in Sentinel playbooks](https://learn.microsoft.com/en-us/azure/sentinel/automation/playbook-triggers-actions)

- [Microsoft Graph User.EnableDisableAccount.All](https://learn.microsoft.com/en-us/graph/permissions-reference)

---

*SecuringM365.com | Part of the Sentinel to Defender Portal: A Practitioner's Migration Guide series*
