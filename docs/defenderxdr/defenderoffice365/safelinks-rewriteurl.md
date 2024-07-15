# Lessons Learnt: Safe Links Rewrap Breaking URLs

---

Ensuring robust protection while maintaining user experience is paramount for clients. One feature in Microsoft Defender for Office 365 that strikes this balance is **Safe Links**. This feature provides real-time URL scanning and protection, safeguarding users from malicious URLs in emails and Office documents.

## The Problem

A common challenge when implementing Safe Links is that legitimate URLs, such as password reset links from trusted domains, can be broken when rewrapped by Safe Links. This can lead to user frustration and increased support tickets, as users are unable to complete necessary actions like resetting their passwords.

## The Resolution

To address this issue, you can configure Safe Links to exclude specific domains from being rewrapped. This ensures that critical links, such as those for password resets, remain functional while still providing protection for other URLs.

### Steps to Exclude Domains:

1. **Access the Microsoft Defender XDR Portal**: Navigate to the [Microsoft Defender portal](https://security.microsoft.com).

2. **Modify Safe Links Policy**:

   - Go to **Email & Collaboration** > **Policies & Rules** > **Threat policies** > **Safe Links**.

   - Select an existing (or create a new) policy that you want to modify.

   - In the policy settings, under the 'URL & Click Protection Settings' page, configure **Do not rewrite the following URLs**.

   - Add the domains or URLs that you want to exclude from being rewrapped.

3. **Save and Apply**: Save the changes and ensure the policy is applied to the relevant users or groups.

---

## An Alternative Control: 

Another approach is to use the setting **"Do not rewrite URLs, do checks via SafeLinks API only"**.

This option tells Defender for Office 365 to scan URLs using the SafeLinks API without modifying or rewrapping them.

### Benefits:

- **Preserves Original URLs**: Keeps the URLs in their original form, preventing issues with broken links, especially for critical functions like password resets.

- **User Transparency**: Users see the original URLs, which can reduce confusion and improve trust.

- **Simplified Management**: Reduces the need to maintain a list of excluded domains.

### Disadvantages:

- **Limited Protection on Some Platforms**: The SafeLinks API checks may not be as comprehensive on all platforms, such as mobile or web-based clients.

- **Potential Delays**: API checks might introduce slight delays when users click on links, depending on network conditions and API response times.

- **Less Granular Control**: Lacks the detailed control over which URLs are rewritten versus checked only via the API.

---

## Lessons Learnt

1. **User Experience Matters**: Balancing security with usability is crucial for End Users. By excluding certain domains or using the SafeLinks API-only option, you can maintain a seamless user experience without compromising on security.

2. **Regular Policy Reviews**: Periodically review and update your Safe Links policies to ensure they align with your organization's needs and any changes in the threat landscape.

3. **Communication is Key**: Inform users about the Safe Links feature and any exclusions or API-only settings in place. This helps in setting expectations and reducing confusion.

## Closing Note

By addressing this problem and implementing the resolution, you can enhance your organization's security posture while ensuring critical functionalities remain intact. This approach not only improves user satisfaction but also reinforces the importance of adaptive security measures.