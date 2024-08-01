# Exploring Tenant Restrictions v2

---

So, lets dive into **Tenant Restrictions v2**

As a key feature of Microsoft Entra, it plays a crucial role in managing external identities and access. This functionality is designed to control who can access what, particularly when interacting with external tenants.

Sounds like a vital component for security, don't you think?

### An Overview

In this overview, Microsoft explores how “Contoso” implements **Tenant Restrictions v2** to enhance security and manage external identities and access. By configuring these restrictions, “Contoso” ensures that only authorized users and applications can interact with their resources. 

![trv2-authenticationflow](./images/trv2-authenticationflow.png)

Let’s break down the process:

| Steps | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| ----- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **1** | "Contoso" configures **Tenant restrictions** in their cross-tenant access settings to block all external accounts and external apps. "Contoso" adds TRv2 enforcement signaling with TRv2 header either via [Universal TRv2](https://learn.microsoft.com/en-us/entra/external-id/tenant-restrictions-v2#option-1-universal-tenant-restrictions-v2-as-part-of-microsoft-entra-global-secure-access) or a [corporate proxy](https://learn.microsoft.com/en-us/entra/external-id/tenant-restrictions-v2#option-2-set-up-tenant-restrictions-v2-on-your-corporate-proxy) and Microsoft Entra ID will enforce TRv2 policy when the header is present on the request. |
| **2** | A user using a "Contoso"-managed device tries to sign in to an external app using an account from an unknown tenant. The TRv2 HTTP header with "Contoso's" tenant ID and the tenant restrictions policy ID is added to the authentication request.                                                                                                                                                                                                                                                                                                                                                                                                             |
| **3** | _Authentication plane protection:_ Microsoft Entra ID will enforce "Contoso's" TRv2 policy and block external accounts from accessing external tenants during the authentication as per the "Contoso" TRv2 policy.                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| **4** | _Data plane protection (preview):_ Microsoft Entra ID will block any anonymous access to SharePoint file or anonymous teams meeting join as well as block user access to the resource with an infiltrated token.                                                                                                                                                                                                                                                                                                                                                                                                                                               |
Source: [Set up Tenant Restrictions v2](https://learn.microsoft.com/en-us/entra/external-id/tenant-restrictions-v2)


---

## Key Features and Benefits

### Granular Control

First off, **Tenant Restrictions v2** builds on the original version, but with some significant upgrades. The main thing that catches my eye is the **granular control** it offers. With TRv2, we can set policies that are super specific – down to individual users, groups, or even applications. This means we can tailor access controls to fit exactly what my organization needs. No more one-size-fits-all approach.

### Server-Side Configuration

Another big improvement is the **server-side configuration**. In the past, with TRv1, everything was managed through proxy-based header injection. That sounds like a headache, especially when dealing with complex network setups. But now, with TRv2, all the configurations are handled server-side. This should simplify things a lot and make policy management more straightforward.

### Enhanced Security

TRv2 is fundamental security; It protects both the **authentication plane** and the **data plane**. This means it’s not just about who can sign in, but also about who can access data within external applications. This dual-layer protection is crucial for defending against sophisticated attacks, like token infiltration or unauthorized data access.

### Compatibility and Flexibility

One thing I find really interesting is how TRv2 integrates with **Microsoft Entra’s cross-tenant access settings**. This makes it flexible and compatible with various scenarios, including B2B collaboration and external app access. It feels like a unified approach to managing external identities, which is exactly what we need in today’s interconnected world.

---

## Compare Tenant Restrictions v1 and v2

The following table compares the features in each version.

|                               | Tenant restrictions v1                                                                                                                                                                                                              | Tenant restrictions v2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| ----------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Policy enforcement            | The corporate proxy enforces the tenant restriction policy in the Microsoft Entra ID control plane.                                                                                                                                 | Options:  <br>  <br>- Universal tenant restrictions in Global Secure Access, which uses policy signaling to tag all traffic, providing both authentication and data plane support on all platforms.  <br>  <br>- Authentication plane-only protection, where the corporate proxy sets tenant restrictions v2 signals on all traffic.  <br>  <br>- Windows device management, where devices are configured to point Microsoft traffic to the tenant restriction policy, and the policy is enforced in the cloud. |
| Policy enforcement limitation | Manage corporate proxies by adding tenants to the Microsoft Entra traffic allowlist. The character limit of the header value in Restrict-Access-To-Tenants: `<allowed-tenant-list>` limits the number of tenants that can be added. | Managed by a cloud policy in the cross-tenant access policy. A partner policy is created for each external tenant. Currently, the configuration for all external tenants is contained in one policy with a 25KB size limit.                                                                                                                                                                                                                                                                                     |
| Malicious tenant requests     | Microsoft Entra ID blocks malicious tenant authentication requests to provide authentication plane protection.                                                                                                                      | Microsoft Entra ID blocks malicious tenant authentication requests to provide authentication plane protection.                                                                                                                                                                                                                                                                                                                                                                                                  |
| Granularity                   | Limited to tenant and all Microsoft Accounts.                                                                                                                                                                                       | Tenant, user, group, and application granularity. (User-level granularity isn't supported with Microsoft Accounts.)                                                                                                                                                                                                                                                                                                                                                                                             |
| Anonymous access              | Anonymous access to Teams meetings and file sharing is allowed.                                                                                                                                                                     | Anonymous access to Teams meetings is blocked. Access to anonymously shared resources (“Anyone with the link”) is blocked.                                                                                                                                                                                                                                                                                                                                                                                      |
| Microsoft Accounts            | Uses a Restrict-MSA header to block access to consumer accounts.                                                                                                                                                                    | Allows control of Microsoft Accounts (MSA and Live ID) authentication on both the identity and data planes.  <br>  <br>For example, if you enforce tenant restrictions by default, you can create a Microsoft Accounts-specific policy that allows users to access specific apps with their Microsoft Accounts, for example:  <br>Microsoft Learn (app ID `18fbca16-2224-45f6-85b0-f7bf2b39b3f3`), or  <br>Microsoft Enterprise Skills Initiative (app ID `195e7f27-02f9-4045-9a91-cd2fa1c2af2f`).              |
| Proxy management              | Manage corporate proxies by adding tenants to the Microsoft Entra traffic allowlist.                                                                                                                                                | For corporate proxy authentication plane protection, configure the proxy to set tenant restrictions v2 signals on all traffic.                                                                                                                                                                                                                                                                                                                                                                                  |
| Platform support              | Supported on all platforms. Provides only authentication plane protection.                                                                                                                                                          | Universal tenant restrictions in Global Secure Access support any operating system, browser, or device form factor.  <br>  <br>Corporate proxy authentication plane protection supports macOS, Chrome browser, and .NET applications.  <br>  <br>Windows device management supports Windows operating systems and Microsoft Edge.                                                                                                                                                                               |
| Portal support                | No user interface in the Microsoft Entra admin center for configuring the policy.                                                                                                                                                   | User interface available in the Microsoft Entra admin center for setting up the cloud policy.                                                                                                                                                                                                                                                                                                                                                                                                                   |
| Unsupported apps              | N/A                                                                                                                                                                                                                                 | Block unsupported app use with Microsoft endpoints by using Windows Defender Application Control (WDAC) or Windows Firewall (for example, for Chrome, Firefox, and so on). See [Block Chrome, Firefox and .NET applications like PowerShell](https://learn.microsoft.com/en-us/entra/external-id/tenant-restrictions-v2#block-chrome-firefox-and-net-applications-like-powershell).                                                                                                                             |
Source: [Compare tenant restrictions v1 and v2](https://learn.microsoft.com/en-us/entra/external-id/tenant-restrictions-v2#compare-tenant-restrictions-v1-and-v2)

---

## Implementing Tenant Restrictions v2

Now, how do we implement this? Here’s a quick rundown:

### 1. Configure Default Policies

Start by setting up default tenant restrictions in the Microsoft Entra admin center. These will apply to everyone unless we specify otherwise.

![trv2-defaults](./images/trv2-defaults.png)

### 2. Add Partner-Specific Settings

For those cases where certain external accounts need access, we can add specific settings that override the defaults.

![trv2-defaults](./images/trv2-tenantrestrictions.png)

### 3. Enforce Policies on Devices

We can then enforce these policies on Windows devices through Group Policy or directly via the admin center. This ensures consistency across all corporate devices.

### 4. Monitor and Audit

Finally, we need to keep an eye on things using Microsoft [Entra’s]() sign-in and audit logs. This helps spot any unauthorized access attempts and maintain a secure environment.


For a more detailed Implementation Plan see: https://learn.microsoft.com/en-us/entra/external-id/tenant-restrictions-v2#configure-server-side-tenant-restrictions-v2-cloud-policy

---

## Conclusion

In conclusion, **Tenant Restrictions v2** seems like a powerful tool for enhancing security in a multi-tenant environment. By offering granular control over both authentication and data access, it ensures that only authorized external accounts can interact with sensitive resources. As we continue to explore digital collaboration, TRv2 looks like a robust solution to safeguard our digital assets.

