# Enabling Protection and Visibility for AI Agents with Microsoft Defender Security for AI

## Update (April 2026)

This article was updated to align with Microsoft Defender Security for AI guidance. Key references:

- https://learn.microsoft.com/en-us/defender-xdr/security-for-ai/defender-security-for-ai
- https://learn.microsoft.com/en-us/defender-xdr/security-for-ai/ai-agent-inventory
- https://learn.microsoft.com/en-us/defender-xdr/security-for-ai/ai-agent-detection-protection

Summary of changes:

- Updated guidance to reflect Defender XDR Security for AI.
- Retained the original Defender for Cloud Apps walkthrough below for tenants that still use the Copilot Studio integration.

When AI agents act on behalf of users, they can access data and invoke tools. That makes visibility, detection, and runtime control essential. This guide explains how Defender and Power Platform work together to provide inventory, detections, and real time protection for AI agents.

## How it fits together

- Microsoft Defender (Defender XDR): discovery, near real time detections, runtime protection, and investigation. Defender integrates with Microsoft Agent 365 and provides Advanced Hunting tables such as AIAgentsInfo.

- Power Platform and the agent runtime: hosts Copilot Studio agents and other Agent 365 managed agents, emits audit logs, and enforces protection decisions at runtime.

- Copilot Studio integration: supplies telemetry and an ingestion endpoint. Federated identity credentials allow Defender to authenticate without secrets.

## Preview and permissions

- Required roles: Security Administrator for Defender and Power Platform Administrator for Power Platform.
- Some features are in preview and may require specific licenses or tenant access.

## Enable Copilot telemetry in Power Platform

1. Sign in to the Power Platform admin center.
2. Go to Security > Threat Detection > Microsoft Defender Copilot Studio AI Agents (Preview).
3. Toggle Enable Microsoft Defender Copilot Studio AI Agents.
4. Wait up to 30 minutes for the connection to establish.

## Connect Copilot Studio real time protection in Defender

1. Open the Defender portal at https://security.microsoft.com/.
2. Go to System > Settings > Security for AI agents.
3. Under AI real time protection and investigation, select Connect for Copilot Studio Real Time Protection.
4. Choose the setup path: automated script or manual app registration.

### Automated script (recommended)

- The script prompts for Tenant ID, Endpoint URL, display name, and a Federated Identity Credential name.
- It checks for MSAL.PS, installs it if needed, creates the app registration and FIC, and returns the App ID.
- This approach reduces manual steps and lowers the chance of errors.

### Manual app registration

1. Create a single tenant app registration in Entra ID.
2. Generate Base64 values for the Tenant ID and the Power Platform ingestion endpoint.
3. Create a Federated Identity Credential on the app using those values.
4. Enter the App ID and Endpoint URL in the Defender settings and save.
5. If saving fails, verify the FIC values and tenant configuration.

## Per environment setup in Power Platform

1. In Power Platform, go to Security > Threat Protection > Additional threat detection and protection for Copilot Studio agents.
2. Select an environment and choose Setup.
3. Enable Allow Copilot Studio to share data with threat detection partner.
4. Enter the App ID and Endpoint URL used in Defender.
5. Set Error Behaviour to Block the Query to fail closed in that environment if Defender blocks an action.
6. Save and confirm the environment shows Connection is On for Environment.

Note: repeat these steps for every environment that runs agents. Enabling the setting in one environment does not enable it tenant wide.

## Runtime behavior

- Defender evaluates agent tool invocations and has about one second to allow or block an action.
- If no decision is made in that window, the runtime defaults to Allow so agents do not fail mid flow.
- Real time protection focuses on high confidence threats such as attempts to extract system instructions, direct data exfiltration, misuse of internal tools, routing to untrusted endpoints, obfuscated content that manipulates agents, and credential leaks.

## Alerts and investigation

- When Defender blocks an action it generates an alert with context, including the agent, tool, and the reason for the block.
- Use Defender incidents, alerts, and Advanced Hunting to investigate and hunt for risks.

## Advanced Hunting and inventory

Use the AIAgentsInfo table to discover agents and their configuration. Example query to get the latest snapshot per agent:

```kql
AIAgentsInfo
| summarize arg_max(Timestamp, *) by AIAgentId
| where RegistrySource == "A365"
| where AgentStatus != "Deleted"
```

Other useful tables include CloudAppEvents, AlertInfo, and AlertEvidence to trace agent activity and correlate alerts.

## What to expect

- Inventory and near real time detections can take a short time to appear after configuration changes.
- Verify App ID and FIC values and update screenshots before enabling per environment protection.

---

Putting these pieces together gives you visibility into agent behavior, the ability to block unsafe actions in real time, and the tools to investigate incidents. If you want, I can split this content into separate pages for overview, inventory, and detection and protection.
