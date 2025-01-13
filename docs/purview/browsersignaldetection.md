# Understanding Microsoft Purview Insider Risk Management and Browser Signal Detection for Microsoft Edge

Managing insider risks is crucial for organizations to protect sensitive data and maintain compliance. Microsoft Purview Insider Risk Management is a powerful tool designed to help organizations detect, investigate, and act on potential insider threats. This blog post will explore the functionality of Microsoft Purview Insider Risk Management and provide a detailed guide on configuring Browser Signal Detection for Microsoft Edge.

## What is Microsoft Purview Insider Risk Management?

Imagine you're the guardian of your organization's most valuable secrets. Microsoft Purview Insider Risk Management is like your trusty sidekick, helping you spot and tackle internal threats like IP theft, data leaks, and security breaches. It works by piecing together various signals to create policies that keep your data safe. Plus, it's built with privacy in mind, so users are pseudonymized by default, and there are strict access controls and audit logs to protect user privacy.

## Key Features of Microsoft Purview Insider Risk Management

1. **Policy Creation and Management**: Think of this as setting up rules to catch any sneaky behavior. You can create and manage policies to detect and act on risky activities, tailored to address specific threats like data theft by departing employees or risky browser usage.
    
2. **Signal Correlation**: This feature is like having a detective on your team. It connects the dots between different activities, such as copying files to personal cloud storage or printing sensitive documents, to identify potential insider risks.
    
3. **Forensic Evidence**: Imagine having a security camera that records all browsing activities. Forensic evidence captures detailed records of user actions, helping analysts and investigators quickly respond to detected risks.

## Browsers and Templates

Think about how often you use web browsers to access files at work. It's a lot, right? Well, insider risk management tools can help your organization keep an eye on those activities. They can detect and act on signals from browsers like Microsoft Edge and Google Chrome when users view non-executable files. This means that if someone tries to:

- Copy files to personal cloud storage
    
- Print files to local or network devices
    
- Transfer or copy files to a network share
    
- Copy files to USB devices
    
- Browse potentially risky websites
    

The system will catch it. In Microsoft Edge, these signals are detected using built-in browser capabilities and the Microsoft Compliance Extension add-on. For Google Chrome, the Microsoft Compliance Extension does the job.

## Forensic Evidence

Forensic evidence is like having a security camera for your digital activities. It's an optional feature in Insider Risk Management that gives security teams visual insights into potential insider data security incidents while respecting user privacy. This feature includes customizable event triggers and built-in privacy protection controls. It helps security teams investigate, understand, and respond to potential insider data risks, such as unauthorized data exfiltration. Organizations can set policies to determine which risky events are most important to capture and which data is most sensitive. Forensic evidence is off by default, and policy creation requires dual authorization. Usernames can be masked with pseudonymization, which is on by default for Insider Risk Management.

## Common Requirements

Before you can install the Microsoft Edge add-on or Google Chrome extension, make sure your devices meet these requirements:

- Latest Windows 10 x64 build (minimum build 1809) for signal detection support.
    
- Browser signal detection isn't supported on non-Windows devices.
    
- Current Microsoft 365 subscription with insider risk management support.
    
- Devices must be onboarded to the Microsoft Purview compliance portal.
    

### Additional Requirements

If you're using policies based on the Risky browser usage template, you need to select at least one Browsing indicator in Insider risk management > Settings > Policy indicators.

## Configuring Browser Signal Detection for Microsoft Edge

Setting up Browser Signal Detection is crucial for detecting and acting on browser exfiltration signals for non-executable files viewed in Microsoft Edge. Here's how to do it:

1. **Meet Common Requirements**: Ensure your devices meet the following:
    
    - Latest Windows 10 x64 build (minimum build 1809).
        
    - Current Microsoft 365 subscription with insider risk management support.
        
    - Devices must be onboarded to the Microsoft Purview compliance portal.
        
2. **Install Microsoft Compliance Extension**: Use the built-in browser capabilities and the Microsoft Compliance Extension add-on for signal detection in Microsoft Edge.
    
3. **Configuration Options**:
    
    - **Basic Setup**: Recommended for testing with Edge. Install the Microsoft Compliance Extension on each device in your organization.
        
    - **Intune Setup**: Configure the extension and requirements using Microsoft Intune. Sign in to the Microsoft Intune admin center, create a profile, and add the required settings for Microsoft Edge extensions.
        
    - **Group Policy Setup**: Configure the extension and requirements organization-wide using Group Policy. Import the latest Microsoft Edge Administrative Template and add the Microsoft Compliance Extension add-on to the Force Install list.
        
4. **Test and Verify**: Create an insider risk management policy with device indicators enabled. Test signal detection for various activities, such as copying files to personal cloud storage, printing files, and saving files to USB devices. Check the Alerts dashboard for insider risk management alerts for the tested activities.
    

By following these steps, your organization can effectively configure Browser Signal Detection for Microsoft Edge, enhancing your ability to detect and mitigate insider risks.

## Conclusion

By configuring Browser Signal Detection for Microsoft Edge, organizations can gain valuable insights into user activities and take timely actions to protect sensitive data. Embrace the power of Microsoft Purview Insider Risk Management to safeguard your organization's digital assets and maintain compliance in an ever-evolving threat landscape.


