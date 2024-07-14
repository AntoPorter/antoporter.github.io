# Automatically Unsanctioning Risky Apps
---

## Enhancing Security with Microsoft Defender for Cloud Apps: Automating App Sanctioning with App Discovery Policies

Ensuring the security of your organization’s cloud environment is paramount. As a Cloud Security Architect, leveraging tools like Microsoft Defender for Cloud Apps (formerly known as Microsoft Cloud App Security) can significantly enhance your security posture. One powerful feature within Defender for Cloud Apps is the App Discovery Policy, which can be used to automatically unsanction applications that do not meet your security criteria. In this post, we’ll explore how to set up an App Discovery Policy to automatically unsanction applications with a score below 6, thereby preventing low-scoring applications from running within your environment.

### Understanding App Discovery and Sanctioning

**App Discovery** in Defender for Cloud Apps provides visibility into cloud apps used within your organization. It identifies apps based on traffic logs and assigns them a risk score based on various factors such as compliance, security measures, and general usage.

**Sanctioning** an app means marking it as approved for use within your organization. Conversely, **Unsanctioning** an app indicates that it is not approved for use, and access to it should be restricted.

### Setting Up an App Discovery Policy

To automatically unsanction applications with a score below 6, follow these steps:

1. **Access Defender for Cloud Apps:** Log in to the Microsoft Defender XDR portal and navigate to Cloud Apps.
    
2. **Navigate to Cloud App Catalog:** In the navigation pane, select ** Cloud App Catalog**. Here, you’ll see a list of all cloud apps along with their risk scores.
    
3. **Create a New Policy:** Click on **New Policy from Search** in the navigation pane.
    
4. **Configure the Policy:**
    
    - **Name and Description:** Give your policy a meaningful name, such as “Unsanction Low-Scoring Apps”.
    - **Filters:** Set the filters under 'Apps matching all of the following' to target apps with a score below 6. You can do this by setting the **Risk score** filter to **less than 6**. Also set **App Tag** to **Does Not Equal** for **Sanctioned** to avoid blocking predefined Sanctioned apps that fall under this score.
    - **Actions:** Under the **Actions** section, select **Tag App as Unsanctioned**. This will automatically mark any app that meets the criteria as unsanctioned.

5. **Set Alerts and Notifications:** Configure alerts to notify your security team when an app is unsanctioned. This ensures that any necessary follow-up actions can be taken promptly.
    
6. **Save and Apply the Policy:** Review your policy settings and click **Create** to save and apply the policy.
    

### Benefits of Automating App Sanctioning

By automating the unsanctioning of low-scoring applications, you can:

- **Enhance Security:** Prevent potentially risky applications from being used within your environment, reducing the attack surface.
- **Improve Compliance:** Ensure that only applications meeting your organization’s security and compliance standards are sanctioned.
- **Increase Efficiency:** Automate routine security tasks, allowing your security team to focus on more strategic initiatives.

### Conclusion

Implementing an App Discovery Policy in Microsoft Defender for Cloud Apps to automatically unsanction low-scoring applications is a proactive step towards securing your cloud environment. By leveraging this feature, you can ensure that only trusted and compliant applications are used within your organization, thereby enhancing your overall security posture.
