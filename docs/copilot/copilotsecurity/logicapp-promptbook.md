# LogicApp Promptbook with Send Email Function
---
## Automated Deployment
[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAntoPorter%2FCopilotForSecurity%2Fmain%2FLogicApp-Promptbook%2Fazuredeploy.json)

---
## Overview

The Logic App template utilizing Copilot for Security is designed to streamline your security operations by automating the process of summarizing and emailing data outputs on a scheduled basis. This integration allows for efficient monitoring and quick response, ensuring that your security posture is proactive rather than reactive. With the ability to customize prompts and tailor the output, the template offers a flexible solution to fit the unique needs of your security infrastructure.

### Pre-Deployment Instructions

Prior to beginning the installation process, it's crucial to confirm that you have met the following prerequisites:

- The User that will deploy this Logic App need to have a Contributor Role to the Resource Group where the Logic App will be created.
- You enabled the Security Copilot SCU within your tenant
- The user authenticated within the Copilot Logic App API Connections has permission to:
	- Send Emails (Exchange License), and 
	- Utilize Copilot for Security (Security Role Permissions)
- You define the Parameters for each Prompt, Including Grounding Parameters, and
- You define the Recurrence of the Logic App to run.

### Post-Deployment Instructions

Upon Deployment of the Logic App, you will be required to Authenticate both the Copilot for Security API Connector and the Office 365 Connector.

This can be achieved by going to the Logic App deployed and navigating to:
1. Navigate to 'Development Tools > API Connections'
2. Selecting the 'Office 365 API' Connection
3. Navigate to 'General > Edit API Connection'
4. Select 'Authorize' and enter in the User Credentials.
5. Click 'Save'.
6. Then repeat the process for the Copilot for Security API Connection.

Once Complete, you will be able to Edit and Save the Logic App Parameters and commence the use of the Logic App Promptbook template.

### Logic App Designer

![LogicAppDesigner-Overview](./Images/LogicAppDesigner-Overview.png)

### Logic App Parameters

- Email: regarding the To: field, which the summary will be sent to.
- Organization Name: Appears in the Email Subject Line
- Sentinel Workspace Name: The Sentinel Workspace you wish to target.
- Resource Group Name: The resource group which the sentinel workspace resides in
- Subscription Name: The subscription which the resource group resides in.
- Azure AD Tenant ID
- Prompt 1
- Prompt 2
- Prompt 3
- Prompt 4

![LogicAppDesigner-Parameters](./Images/LogicAppDesigner-Parameters.png)

### Prompt Template

- Prompt 1: Includes the grounding parameters required to investigate Sentinel and Defender incidents.
- Prompt 2 and 3: Have been left blank for your convenience.
- Prompt 4: Has been updated to include the 'SummarizeData' Skill Name, and a prepopulated Prompt to receive a summary of the investigation with an Executive and Technical Summary.

### Important Information

- All Prompts within the Logic App are related to the Session ID created by Prompt 1. This ensures that all prompts are using the same prior context and grounding information.
- The Output of Prompt 4 is what will be captured in the Email Body to be sent.

**NOTE: If you do not plan to use some of the Parameters included in Prompt 1, remove them from the prompt content to avoid confusing Copilot for Security. This will occasionally cause Evaluation Result Type: "Error" upon running the Logic App.**

### Email Output

Upon the successful Logic App run, the "Email" recipient should receive a Markdown style email with relative summary information as to your investigation.

![LogicApp-Markdown Email](./Images/LogicApp-MarkdownEmail.png)

## Prompt Inspiration

For prompt inspiration, please visit [Copilot for Security Prompt Inspiration](promptinspiration.md).

---

**Disclaimer**: Please be aware that the logic apps provided are examples intended for use with Copilot for Security. Users are encouraged to customize these samples to meet their specific requirements. These should serve as guidelines and inspiration for creating tailored logic apps for ones own use

**Technical Disclaimer: Logic Apps, SCU Usage, and Best Practices**

---

**Attention Customers!**

When utilizing Logic Apps on Copilot, please be aware that it may result in increased consumption of Secure Compute Units (SCUs). We recommend closely monitoring SCU usage to optimize resource management.