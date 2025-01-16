# Microsoft Summer Bootcamp Recap - Day 3

## Zero Trust 101: Embracing Proactive Security

**Speaker**

- Vik Verma - Information Security Global Black Belt
    

**Key Notes**

- **One new reality intensifies security challenges - how do we drive operational resiliency while strengthening cybersecurity?**
    
    - Hybrid Work
        
    - Threat Protection across multiple cloud/platforms
        
    - Enforcing security policies across layers
        
    - Increase diversity of users and endpoints accessing the network
        
    - Complex digital environments full of unknown vulnerabilities
        
    - Zero trust required by enterprises and governments worldwide
        
    - 81% of enterprises have begun the move towards hybrid workplace
        
    - 55% of organizations report detecting a phishing attack in the last 18 months
        
    - 58% days longer to respond to a breach when more than half the employees are remote
        
    - 1070% increase in ransomware between July 2020 and June 2021
        
- **Zero Trust strategy defined** - A proactive, integrated approach to secure across all layers of the digital estate that explicitly and continuously verifies every transaction, asserts least privilege, and relies on intelligence, advanced detection, and real-time response to respond to threats
    
    - **Guiding Principals of Zero Trust**
        
        - Verify Explicitly
            
        - Use Least Privilege
            
        - Assume Breach
            
    - **Implementing controls across pillars** - Governance and Threat Protection across:
        
        - Identities, Endpoints, Apps, Data, Infrastructure, and Network
            
    - **Identities**
        
        - Secure access for any identity, from anywhere, to any app, AI, or resource
            
            - Establish Zero Trust access controls
                
            - Secure access for your employees
                
            - Secure access for customers/partners
                
            - Secure access in any cloud
                
            - Secure access at the speed and scale of AI
                
        - Unified approach for Identity Security
            
            - Securely provide remote access to only approved applications
                
            - Automatically provide access based on the role
                
            - Remove all permissions and licenses when employees leave
                
            - Allow only approved internet services to be accessed
                
    - **Endpoints**
        
        - Endpoint Security Management:
            
            - Simple, Cross-platform, unified endpoint security management console
                
            - Intuitive, advanced policy management capabilities
                
            - Security controls granularity and completeness
                
            - Continuous assessment and reporting of endpoint state
                
    - **Data**
        
        - Data Security Incidents are Widespread: 83% of organizations experience more than one data breach in their lifetime
            
        - Insiders account for 20% of data breaches, adding to costs: $15.4M is the total average cost of activities to resolve insider threats over a 12-month period
            
        - Organizations are concerned about data leak in Generative AI: 80%+ of leaders cited leakage of sensitive data as their main concern around adopting Generative AI
            
- **Implementing Zero Trust Strategy**
    
    - Align with Microsoft Zero Trust Adoption Framework (Now a part of Exposure Management)
        
    - Track Metrics to Understand Gaps
        
    - Get Actionable Recommendations
        
    - **"Zero Trust is a Transformation"** - Including multiple modernization initiatives:
        
        - Secure Identities and Access - Modern Identity & Access Control
            
        - Modern Security Operations (SOC)
            
        - Infrastructure & Development Security
            
        - Data Security & Governance, Risk, Compliance (GRC)
            
        - IoT and OT Security
            
    - **Zero Trust Rapid Modernization Plan (RaMP)**
        
		- [aka.ms/ZTRaMP](https://aka.ms/ZTRaMP)


---

## Unlocking the Power of Microsoft Entra Suite: Comprehensive Security and Identity Management for the Modern Enterprise

**Speaker**

- Vik Verma - Information Security Global Black Belt
    

**Key Notes**

- **Agenda**
    
    - Introduction - Identity as the key security vertical
        
    - Secure remote access with Entra Private Access
        
    - Automate identity and access lifecycle with Entra ID Governance
        
    - Monitor and protect network access with Entra Internet Access
        
    - Make onboarding efficient and secure with Verified ID
        
    - Unifying to maximize business impact
        
- **Entra Suite Overview**
    
    - Unify access controls across identity, endpoint, and network
        
    - Secure access to apps and resources for on-premises and any cloud
        
    - Ensure least privilege access to any app or resource, including AI
        
    - Improve the user experience for remote, home, and in-office work
        
- **Microsoft Entra Suite**
    
    - Security Service Edge
        
    - Identity Protection
        
    - Governance
        
    - Identity Verification
        
- **Enterprise Identity and Network Security**
    
    - **Business Outcome 1: Securely provide access to essential private and public resources**
        
        - Legacy network security approaches are no longer sufficient
            
            - Challenges with conventional approaches include:
                
                - Dramatic traffic increase strains network capacity and on-premises security stack. Sub-optimal user experience on account of traffic hair-pinning.
                    
                - Users circumvent IT controls and access resources directly
                    
                - Compromised users/devices can move laterally on traditional corporate networks.
                    
        - Modernize private app access with an identity-centric ZTNA (Zero Trust Network Access)
            
        - **From VPN to ZTNA**
            
            - Quick Access - Easy migration from VPNs to Zero Trust Network Access to all private apps with Quick Access policy
                
            - App Discovery - Discover apps and onboard/register them in Entra ID
                
            - Per App Access - Configure access to a well-known private app with a policy
                
            - Rich apps and app segments - Support for non-https apps with SSO for legacy protocols like Kerberos
                
            - App groups and policies - Assign policies to individual apps or to a group of apps.
                
            - Enable seamless user experience with SSO - by allowing SSO access to popular SaaS apps, on-premises and custom-built apps on any cloud, for any user type, and any identity.
                
            - Secure business-critical Private and Public Apps with Unified Access Policies.
                
        - **In Summary**
            
            - Microsoft Entra Private Access:
                
                - Replaces legacy VPN with an identity-centric ZTNA
                    
                - Enforces adaptive Conditional Access across all private resources
                    
                - Delivers fast, consistent access at global scale.
                    
    - **Business Outcome 2: Automate employee lifecycle management**
        
        - Automated Identity Lifecycle Management
            
            - Provision Identities from HRS / System of Record (SOR) - Joiner, Mover, Leaver (JML)
                
                - Apply admin credentials information such as username, password, web service API for Entra ID, as well as On-Premises AD Domain select and Default OU.
                    
            - API-Driven Provisioning
                
    - **Business Outcome 3: Role-based access provisioning across all apps and resources**
        
        - Role-Based Access Management
            
            - Provision/Update Identities from HRS / System of Record (SOR) - Joiner, Mover, Leaver (JML)
                
            - Define the Role itself as an 'Access Package'
                
                - Add apps and resources as part of the Access Package
                    
                    - This includes the Role access included in each of the Application, SharePoint Site, Group, and Team etc.
                        
                - Integrating external / disconnected applications
                    
                    - This includes custom extensions to Stage based on a flow
                        
            - Role approval requirements
                
                - Includes "require approval", "require requestor's justification", and "1, 2, or 3 stages of approval"
                    
            - Role lifecycle
                
                - Includes Expiration of access and access review (similar to Privilege Identity Management)
                    
            - You can also configure an Auto Assignment policy
                
                - This flows similar to Dynamic Security groups using Rule Syntax.
                    
                    - This includes the ability to automatically create and remove assignments.
                        
            - Access Packages can be requested by users, set by All Members (Including Guests), All Members (Excluding Guests), Specific Users, or Admin Assignment Only.
                
        - Lifecycle Orchestration (Joiner-Mover-Leaver)
            
            - Create and Use templates tagged as 'Joiner', 'Mover', and 'Leaver'.
                
            - Review and append tasks assigned to the template.
                
                - This can include such tasks as:
                    
                    - Add user to groups
                        
                    - Disable user account
                        
                    - Delete user account
                        
                    - Remove all licenses from user
                        
                    - and Many more.
                        
                - This also allows for a "Send email before users' last day" function.
                    
    - **Business Outcome 4: Securely collaborate with External partners and Subsidiaries**
        
        - Secure External Collaboration (External Tenant Restrictions in Entra ID)
            
            - Manage Inbound and Outbound Access settings
                
            - Define roles targeted to external partners/vendors
                
        - Access Certification and Policy Enforcement
            
            - Identify Inactive External Users using Microsoft Entra ID's 'Insights and Reporting | Inactive guest accounts'
                
                - This will provide an overview of guest accounts inactive in the past 90 days.
                    
            - Access Reviews - Remove inactive external guests from your tenant
                
                - To do this:
                    
                    - Scope to Guest Users Only
                        
                    - Determine the desired inactivity period
                        
                    - Set action to apply on denied guests: Block user from signing in for 30 days, then remove user from tenant.
                        
    - **Business Outcome 5: Modernize network security to protect users, apps, and resources**
        
        - Microsoft Entra Internet Access - An identity-centric secure web gateway (SWG)
            
            - Improve end-user experience and boost user productivity with best-in-class availability, and performance. Eliminate extra hops to optimize traffic routing to Microsoft 365 services.
                
                - Restore source IP context for all Entra ID risk assessments - User Risk and Sign-In Risks.
                    
                - Restore source IP context for all Entra ID activity logs.
                    
                - Maintain backward compatibility for Source IP based location checks in Conditional Access
                    
                - Maintain backward compatibility for source IP Continuous Access Evaluation (CAE) location checks in Microsoft Applications (DataPath - in Public Preview)
                    
            - Prevent token theft/replay attacks across the authentication plane by extending Compliant Network check through Conditional Access.
                
                - Verify device or network compliance for your tenant through Compliant Network check integrated in Conditional Access
                    
                - Avoid source IP manageability overhead.
                    
                - Instantly revoke stolen access tokens and cookies with continuous access evaluation integration for Microsoft apps (in Public Preview)
                    
            - Protect against data exfiltration from unauthorized foreign tenants by enabling Universal Tenant Restriction controls across all managed devices and network branches agnostic of OS and browser platform.
                
                - Protect against data exfiltration by unauthorized foreign identities to foreign tenants
                    
                - Enable universal tenant restriction across all managed devices and network (branch) agnostic of operating system and browser platform.
                    
                - Built-In support for cross-tenant access monitoring - monitor cross-tenant access before enforcing policies.
                    
                - Eliminate need for enterprise managed network proxies and break and inspect for Microsoft traffic.
                    
                - Protect against anonymous access and token infiltration attacks with DataPath coverage for Microsoft Apps (in Public Preview)
                    
            - Configure functions such as:
                
                - Web Content Filtering
                    
                - Traffic Forwarding
                    
                - Conditional Access
                    
            - **In Summary**
                
                - Microsoft Entra Internet Access:
                    
                    - Monitor M365 and broader internet traffic to attain visibility and control
                        
                    - Prevent risk of malicious access through compromised M365 external tenants using Tenant Restrictions.
                        
                    - Secure and Govern internet access using context-aware adaptive access policies linked to user, device, and network context.
                        
    - **Business Outcome 6: Reduce risk with visual verification for high-impact scenarios**
        
        - Improving onboarding with verifiable credentials - Microsoft Entra Verified ID with entitlement management
            
            - Reduce need for self-attestation by new employees or business partners. Users requesting access will be able to obtain identity attributes from a wide set of issuers
                
            - Simplifies approval processes, as approvers do not need to personally vet requestor's authenticity of claims
                
            - Simplifies compliance posture with increased consistency and reduced need for manual intervention.
        

---

## Microsoft Defender XDR: The solution to modern cyberattacks

**Speaker**

- Kim Kischel - Director of Product Marketing, Cybersecurity
    
- Scott Woodgate - Senior Director, Microsoft Security Business
    

**Key Notes**

- **Defending against cybercrimes has never been harder...**
    
    - >130% increase in ransomware attacks
        
    - 80 security tools for an average-sized organization
        
    - 2 in 5 security leaders feel they're at risk due to cybersecurity staff shortage.
        
- **Survey: What's the biggest challenge your organization faces?**
    
    - 51% - Understaffed/skills gap
        
    - 23% - Too many tools/platforms
        
    - 15% - Response time to attacks
        
    - 11% - Too many alerts/processes
        
- **What is XDR?**
    
    - Extended Detection and Response platforms are designed to deliver a holistic, simplified approach to protect organizations against advanced attacks with a complete view of the kill chain for more effective investigation and response across multiple domains using vast sets of intelligence and built-in artificial intelligence (AI).
        
- **Microsoft Defender XDR - Building a Unified Defense**
    
    - **Prevent**
        
        - Reduce attack surface with threat-based configuration recommendations and built-in vulnerability management.
            
    - **Protect**
        
        - Automatically contain and remediate compromised assets.
            
    - **Detect and Respond**
        
        - Use incident response to respond to cross-workload threats from a single portal
            
        - Speed up response with an experience designed for SOC efficiency.
            
    - **Extend**
        
        - Unified APIs and connectors
            
    - **Enable Rapid Response with XDR-Prioritized Incidents**
        
        - Remediate threats quickly with a complete view of the kill chain, and prioritize investigation and response at the incident level.
            
    - **Disrupt Advanced Attacks at Machine Speed**
        
        - Stop lateral movement of advanced attacks with advanced AI capabilities that automatically isolate compromised devices and user accounts.
            
    - **Transform SOC productivity with Security Copilot**
        
        - Respond to cyberthreats faster with step-by-step guidance, empower any analyst to build queries in natural language, and reverse-engineer adversarial scripts in seconds.
            
    - **Unify Security and Identity access management**
        
        - Protect your hybrid identities and identity infrastructure from credential threats and other threats with seamless integration of Microsoft Entra ID and XDR.
            
    - **Attack Disruption**
        
        - Detect / Classification / Attack Disruption
            
            - Only triggers on a very high degree of confidence
                
            - AI and ML model determines the threat, intention, and tactics.
                
            - Stops an attack during its process (not after the attack has occurred)
                
            - Attacks are disrupted, but the cleanup tasks would need to be completed by SOC (re-image devices, unblock users etc.)
                
- **Microsoft Security Copilot**
    
    - Investigate and respond to threats in a guided experience
        
        - Summarize an incident and analyze the impact
            
        - Provide guided recommendations
            
        - Generate post-event reports in seconds
            
    - Upskill security talent
        
        - Run queries using natural language
            
        - Analyze complex scripts
            
        - Reverse engineer malware in real-time
            
    - Assess risks with AI-driven threat intelligence
        
        - Inquire in natural language about emerging threats
            
        - Generate contextualized, summarized insights for rapid response
            
- **Takeaways**
    
    - Microsoft Defender XDR consolidates isolated tools into one consolidated platform to tackle even the most advanced attacks
        
    - An XDR needs to seamlessly connect information for both the security and identity admin teams
        
    - AI is set to change the game for security teams.
        
    - Automation is a key component of XDR and attack disruption is a life saver.
        

---

## Boost Developer Productivity with AI

**Speaker**

- Tricia Read - Azure Digital & Application Innovation Specialist Manager
    
- Amanda Tan - Developer Productivity Specialist, Global Black Belt
    
- Michelle Sandford - Developer Engagement Lead
    

**Key Notes**

- **Developers determine speed of innovation**
    
- **Software development is changing**
    
    - More Complexity -> >1000 Unique services in the Cloud-Native ecosystem
        
    - More Risk -> 245,000 Malicious packages discovered, 2x all previous years combined
        
    - More Collaboration -> 36% of time typical developers spend in meetings, answering emails, and other collaboration activities.
        
- **"Turbocharge developer productivity" - The Microsoft developer platform**
    
    - Developer Compute - Dev Box (with Visual Studio)
        
    - Engineering Platform - GitHub
        
    - Development Environments - Azure
        
- **AI helps across the entire software development lifecycle**
    
    - **Build Stages:**
        
        - Code faster with code suggestions
            
        - Migrate code
            
    - **Test Phase:**
        
        - Faster bug finding and fixing
            
        - Generate Unit test cases
            
    - **Deployment Phase:**
        
        - Sys Admin Scripting
            
        - Code to Doc, Doc to Code
            
- **Microsoft Dev Box** - Gives developers self-service access to high-performance, cloud-based workstations that are preconfigured and ready-to-code
    
    - Ready to Code
        
    - Flexible but Controlled
        
    - Managed and Secure
        
- **Azure Deployment Environments** - Reduce cycle times and accelerate delivery
    
    - Minimize configuration effort
        
    - Secure with confidence
        
    - Standardize through templates
        
        - **Results within Microsoft:**
            
            - 20,000 Microsoft Dev's empowered with Dev Box
                
            - Reduce workstation setup time to one hour or less
                
            - Reduce time-to-build by up to 64%
                
- **GitHub Platform**
    
    - A single integrated enterprise-ready platform
        
    - Industry-best collaborative tools for developers
        
    - Security at every step of the workflow
        
    - Powered by AI
        
    - **GitHub Enterprise Cloud** - Enabling open-source culture and best practices in your organization in the cloud:
        
        - Increase collaboration and foster inner source practices
            
        - Breaking silos
            
        - Higher developer familiarity and satisfaction
            
    - **GitHub Advanced Security** - Securing the software supply chain:
        
        - Dependency scanning
            
        - Extensible framework for code scanning
            
        - Scanning for leaked secrets in repos
            
- **"Security Built into the Developer Lifecycle"**
    
    - ' Plan > Code > Build > Test > Release > Deploy > Operate > Monitor > '
        
- **Microsoft's comprehensive solution**
    
    - GitHub Advanced Security - Developer-first Tooling
        
    - Azure Container Registry - Native security capabilities
        
    - Defender for Cloud - Automation
        
- **"Take the next AppSec steps with Azure Innovate"** - Leverage Microsoft funding and investment programs, partners and technical experts through the end-to-end journey
    
    - Envision Workshop - Workshop with Microsoft and your Security, Compliance and Engineering Teams to understand solutions unique to your organization.
        
    - Proof of Concept - Put your security vision into action with a technical pilot.
        
    - Move to Production - Leverage implementation and technical resources to move from pilot to production, and upskill your team in new processes.
        
**"Take advantage of extensive Azure resources"**

- Offering: Azure Innovate - Take advantage of money-saving offers to help offset your Developer Productivity project costs
    
- Partners: Advanced Specialization - Certified Partners with specialization in Apps, DevOps, Security, Data, and AI.
    
- Guidance: Reference Architectures - Leverage enterprise-grade best practices from Developer Productivity Solutions.
    
- Skilling: Microsoft Learn - Self-paced training and docs on Developer Productivity.
    
- Thought Leadership: eBook - 6 Tips to integrate Security into Your DevOps practices.
    

---

## Accelerate business growth with AI applications on Azure

**Speaker**

- Peachy Hongsuwong - App Innovation Specialist for Retail Commercial
    
- Scott Holden - Principal Solutions Specialist, Global Black Belt, App Innovation
    

**Key Notes**

- **"Every app will be reinvented with AI"**
    
- **"New apps will be built that weren't possible before"**
    
- **Generative AI makes apps truly intelligent**
    
    - **Modern Apps:**
        
        - Modern app development principles
            
        - Microservices-based architecture
            
        - Rapid innovation with CI/CD
            
    - **Intelligent Apps:**
        
        - Natural Language interaction
            
        - Data-driven, personalized experiences that improve over time
            
        - Enhances and streamlines automation
            
- **Build Transformational Intelligent Apps with Azure**
    
    - **Developer Tools:**
        
        - Visual Studio
            
        - GitHub
            
        - Power Platform
            
    - **Azure:**
        
        - App Platform
            
        - Data & AI for Apps
            
        - Developer Platform
            
        - Migration & Modernization
            
- **Announcing: GitHub Copilot**
    
    - Generally Available - Copilot Chat
        
    - New - Pull Requests
        
    - New - Copilot in GitHub Mobile
        
    - New - Copilot Enterprise
        
        - 46% of new code is now written by AI
            
        - 96% of developers are faster with repetitive tasks
            
        - 75% of developers feel more focused on satisfying work
            
- **Azure App Platform**
    
    - **Azure Application Services:**
        
        - Azure Kubernetes Service
            
        - Azure Container Apps
            
        - Azure App Service
            
        - Azure Spring Apps
            
        - Azure Functions
            
        - Logic Apps
            
    - **Announcing: Azure Kubernetes Service**
        
        - Generally Available - Kubernetes Fleet Manager
            
            - Kubernetes Fleet - Multi-Cluster Update
                
        - New - Cost Management
            
        - New - Kubernetes AI Toolchain Operator
            
            - Announcing: AI Toolchain Operator add-on for AKS
                
                - Workspace and Infrastructure setup to model inferencing, in a matter of minutes.
                    
    - **Public Preview - Node Auto Provision**
        
        - Deploy the right Infrastructure for your workloads and effectively bin pack your applications to reduce running costs
            
        - Built on the Open Source Karpenter project, with the AKS provider also being made openly available.
            
    - **Public Preview - Artifact Streaming**
        
        - Connect your AKS cluster to ACR.
            
        - When you deploy on AKS, Microsoft only pulls the necessary layers for initial pod startup, reducing the time it takes to pull images and deploy workloads.
            
            - _Reduce pod startup time for large images by an estimated 15% or more_
                
    - **Azure Container Apps for Intelligent Apps**
        
        - New - GPU-Enabled Workload Profiles (Preview)
            
            - Combine GPU with Serverless jobs and container apps
                
        - New - Vector DB Add-On (Preview)
            
            - Training/Inference and custom business logic on one platform
                
        - New - Easy Code Onboarding (Preview)
            
            - No Docker or container knowledge required.
                
    - **Build Intelligent Apps with Azure Functions**
        
        - Chatbots / AI Powered Assistants
            
        - BYO Data for RAG
            
        - Build Actions / Functions for OpenAI
            
        - Parse data for model training
            
    - **Early Access Preview - Flex Consumption Plan**
        
        - Flexibility of Scale - Scale and throughput on your own terms with instance size choice, concurrency control, and fast and large scale out.
            
        - Private Networking - Reach VNet secure services and secure your Function Apps behind Virtual Networks.
            
        - Serverless - Only pay while there's function executions or for optional always ready instances, with no Maximum function execution time.
            
    - **General Availability - Azure Chaos Studio**: A fully managed platform for discovering, experimenting, and orchestrating chaos testing by deliberately introducing faults that simulate real-world outages
        
        - New - Experiment Templates
            
            - Get started quickly with common experiment design
                
        - New - Load Testing Faults
            
            - Start and stop Azure Load Testing from within your experiment
                
        - New - Dynamic Targets
            
            - Use KQL to dynamically select targets at runtime
                
- **Data & AI for Apps**
    
    - Generally Available - Azure Cosmos DB vector search
        
        - Unlocking next-generation vector search for any application
            
    - Generally Available - Vector Search in Azure AI Search
        
        - Revolutionary Information retrieval for GenAI applications
            
    - **Announcing - Latest Azure Open AI Models**
        
        - Preview - GPT-4 Turbo
            
        - Preview - DALL-E-3
            
        - Preview - GPT-4 Turbo with Vision
            
    - **Announcing - Model as a Service with Azure AI**
        
        - Meta's Llama 2
            
        - Mistral's Premium Models
            
        - G42's Jais
            
        - Cohere's Command
            
        - Ready to use APIs
            
        - Hosted Finetuning
            
        - Integrated with leading LLM tools
            
    - **Announcing Azure AI Content Safety**
        
        - New Severity Levels and Enhanced Customer Controls
            
        - Jailbreak Attempt Detection
            
        - Protected Materials Detection
            
- **Developer Platform**
    
    - **Preview - Microsoft Copilot for Azure**
        
        - Generate deep insights instantly - Find personalized solutions for your workload with an AI assistant that knows your environment
            
        - Discover new cloud functionality - Ask Copilot questions using Natural Language to discover and utilize the full functionality of Azure services.
            
        - Do complex tasks faster - Optimize processes, resources, and workloads with AI orchestration and analytics
            
    - **Public Preview - Dev Box-compatible images with Docker Desktop**
        
        - Try at: [aka.ms/devbox/preview/docker-desktop](https://aka.ms/devbox/preview/docker-desktop)
            
    - **Private Preview - Config-as-code Dev Box Customizations**
        
        - Developers can directly create devbox.yaml files that specify additional configuration on top of a VM base image.
            
        - IT and Dev Infrastructure teams can curate the software and settings that Developers can use.
            
    - **Generally Available - Dev Box Managed Networks**
        
        - Get started: [aka.ms/devbox/learn/hosted-networks](https://aka.ms/devbox/learn/hosted-networks)
            
    - **Public Preview - Azure Deployment Environments integration with Azure Developer CLI**
        
        - Deploy environments from the Azure Developer CLI using Azure Deployment Environment templates
            
    - **Private Preview - Bicep IaC Templates**
        
        - Platform engineers and dev leads can now use Bicep in Azure Deployment Environments
            
        - Sign Up for the Private Preview: [aka.ms/ade-bicep-signup](https://aka.ms/ade-bicep-signup)
            
- **Migration & Modernization**
    
    - **Cloud Journey:**
        
        - Pressing Priorities - Managing rising costs, maintain security and compliance, control IT sprawl
            
        - Be AI-ready - Embrace responsible, secure AI and Cloud-Native technologies.
            
    - **Migrate, Operate, Optimize**
        
        - Simplify your migration journey with tooling for developers to stay productive
            
        - Let the platform manage operational complexity so you can focus on value
            
        - Run your production workloads with security and resiliency in mind
            
    - **Announced July 2023 - Azure Migrate and Modernize & Azure Innovate**: Offers spanning Migration to Innovation in one place
        
        - Comprehensive resources in one place
            
        - Direct access to experts and funding
            
        - Extensive coverage - from migration to innovation
            
        - Learn More: [aka.ms/AzureHeroOfferings](https://aka.ms/AzureHeroOfferings)
        