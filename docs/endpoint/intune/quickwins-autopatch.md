# Quick Win: Transitioning from WSUS to Windows Autopatch

As organizations evolve, the need to adopt modern IT management solutions becomes imperative. Microsoft has officially announced the deprecation of Windows Server Update Services (WSUS). This move encourages organizations to transition to more efficient, cloud-based solutions like Windows Autopatch. This article will guide you through configuring Autopatch, the prerequisites, and the benefits of making the switch from WSUS.

## Deprecation of WSUS

Microsoft has announced that WSUS will no longer receive new feature updates or active development. While it will continue to operate, support for WSUS is set to end in 2025. This deprecation means organizations must transition to modern update management tools to maintain compliance, security, and efficiency.

## Intune Capabilities for Windows Updates

With the deprecation of WSUS, Microsoft Intune emerges as a powerful alternative for managing Windows Updates. Intune offers a comprehensive suite of capabilities to ensure devices are always up-to-date, secure, and compliant. Here are the key capabilities of Intune related to Windows Updates, with an emphasis on Windows Autopatch:

- **Windows Autopatch**: Automates the update process for Windows, Microsoft 365 Apps for Enterprise, Microsoft Edge, and Microsoft Teams. Autopatch ensures timely updates, enhances security, and reduces the administrative burden on IT staff.
    
- **Update Rings**: Define and configure update rings in Intune to manage when and how updates are installed. This allows for a staged rollout of updates, minimizing disruptions and ensuring stability.
    
- **Quality and Feature Updates**: Intune allows you to manage both quality updates (security and reliability) and feature updates (new capabilities) for Windows devices, ensuring that devices are always running the latest versions.
    
- **Driver and Firmware Updates**: Manage driver and firmware updates through Intune, ensuring that all hardware components are up-to-date and functioning correctly.
    

This article delves into configuring Windows Autopatch, the prerequisites, and the benefits of using this modern update management solution.

## Configuration and Prerequisites

### Prerequisites

Before configuring Windows Autopatch, ensure that you meet the following prerequisites:

- **Licensing**: Windows 10/11 Enterprise E3+ or F3 licenses, included in Microsoft 365 F3, E3, or E5.
    
- **Microsoft Entra ID**: Required for co-management.
    
- **Microsoft Entra Joined Devices**: Devices must be either Microsoft Entra hybrid joined or Microsoft Entra joined.
    
- **Microsoft Intune**: Use Configuration Manager 2010 or greater for co-management.
    
- **Infrastructure**: Ensure your infrastructure supports cloud-based endpoint management.
    

Source: [Prerequisites | Microsoft Learn](https://learn.microsoft.com/en-us/windows/deployment/windows-autopatch/prepare/windows-autopatch-prerequisites?tabs=business-premium-a3-entitlements%2Cbusiness-premium-a3-intune-permissions)

### Configuration

To configure Windows Autopatch, follow these steps:

1. **Enroll Tenant**: Enroll your tenant into the Windows Autopatch service through the Microsoft Endpoint Manager admin center.
    
2. **Device Registration**: Register your devices with Autopatch. Ensure that devices are Microsoft Entra hybrid joined or Microsoft Entra joined and enrolled in Microsoft Intune.
    
3. **Update Rings**: Configure update rings in Intune to manage when and how updates are installed, ensuring consistent application across your organization.
    

Source: [Start using Windows Autopatch | Microsoft Learn](https://learn.microsoft.com/en-us/windows/deployment/windows-autopatch/prepare/windows-autopatch-feature-activation)

## Benefits of Using Autopatch

Switching to Windows Autopatch offers several advantages over traditional WSUS:

- **Automated Updates**: Autopatch automates the update process for Windows, Microsoft 365 Apps for Enterprise, Microsoft Edge, and Microsoft Teams. This reduces the administrative burden on IT staff and ensures timely updates.
    
- **Reduced Administrative Burden**: Microsoft manages the update process, allowing IT administrators to focus on other critical tasks.
    
- **Improved Security**: Automated updates ensure vulnerabilities and quality updates are addressed promptly, enhancing overall security.
    
- **Compliance**: Autopatch helps maintain compliance by aligning with industry standards and ensuring all devices are up-to-date.
    
- **Efficiency**: The automated nature of Autopatch makes the update process more efficient, reducing downtime and minimizing the impact on end-users.
    

### Update Rings and Group Allocation

Windows Autopatch uses multiple progressive deployment rings to manage updates:

1. **First Deployment Ring**: Receives updates first, allowing for early detection of issues. Typically includes a small group of devices used for testing and validation.
    
2. **Last Deployment Ring**: Receives updates last, ensuring potential issues have been resolved. Ideal for devices requiring maximum stability.
    
3. **Dynamic Mix**: Middle groups receive updates dynamically based on the organization's custom configuration. Designed to balance the deployment load and minimize user impact.
    

Update rings are managed through static group allocation for the first and last deployment groups and a dynamic mix for the middle groups. This approach ensures a gradual rollout of updates, reducing the risk of widespread issues.

Source: [Manage Update rings | Microsoft Learn](https://learn.microsoft.com/en-us/windows/deployment/windows-autopatch/manage/windows-autopatch-update-rings)

## Entra Joined Setup

Windows Autopatch supports Microsoft Entra hybrid joined and Microsoft Entra joined devices. Here are the benefits and capabilities associated with this setup:

- **Seamless Integration**: Microsoft Entra ID provides a seamless integration with Windows Autopatch, allowing for easy management and deployment of updates across your organization.
    
- **Enhanced Security**: Microsoft Entra joined devices benefit from improved security features, such as conditional access policies, multi-factor authentication, and single sign-on, ensuring that only authorized users and devices can access corporate resources.
    
- **Centralized Management**: By leveraging Intune for device management, you can manage, monitor, and report on the update status of all Entra joined devices from a single console. This provides better visibility and control over your IT environment.
    
- **Simplified Onboarding**: Enrolling devices into Windows Autopatch is straightforward with Microsoft Entra joined devices, streamlining the onboarding process and reducing administrative overhead.
    

## Configuration Manager via Co-Management

For organizations using Configuration Manager, co-management allows efficient management of the Windows Update workload. Here are the benefits and capabilities associated with co-management:

- **Flexibility**: Co-management enables organizations to transition workloads to Intune at their own pace, allowing for a gradual migration from traditional on-premises management to modern cloud-based management.
    
- **Workload Separation**: Organizations can choose which workloads to manage with Configuration Manager and which to manage with Intune. For example, you can continue using Configuration Manager for application deployment while using Intune for Windows Update management.
    
- **Enhanced Capabilities**: Co-management allows organizations to take advantage of the unique capabilities of both Configuration Manager and Intune. This includes leveraging Intune's advanced reporting, compliance policies, and cloud-based management features. This also means that you can ensure that your Intune environment operates the way you need it too, before completely transitioning.
    
- **Improved User Experience**: By using co-management, organizations can provide a consistent and seamless experience for end-users, regardless of whether their devices are managed by Configuration Manager or Intune.
    

Source: [Co-management for Windows devices - Configuration Manager | Microsoft Learn](https://learn.microsoft.com/en-us/mem/configmgr/comanage/overview)

## Conclusion

If you are looking for more assistance on how to deploy Windows Autopatch to your organization, I personally would suggest checking the following Windows Autopatch deployment guide: [Windows Autopatch deployment guide | Microsoft Learn](https://learn.microsoft.com/en-us/windows/deployment/windows-autopatch/overview/windows-autopatch-deployment-guide).

This guide:
    
- Helps you plan your deployment and adopt Windows Autopatch
    
- Lists and describes some common objectives
    
- Provides a recommended deployment plan
    
- Provides migration considerations for Windows Update for Business (WUfB) and Microsoft Configuration Manager
    
- Lists some common general considerations when deploying Windows Autopatch
    
- Provides suggested business case benefits and communication guidance
    
- Gives additional guidance and how to join the Autopatch community
    

With the deprecation of WSUS, transitioning to Windows Autopatch is a strategic move that offers significant benefits, including automated updates, reduced administrative burden, improved security, and enhanced compliance. By following the configuration steps and best practices outlined in this guide, you can ensure a smooth transition and maximize the benefits of modern update management.