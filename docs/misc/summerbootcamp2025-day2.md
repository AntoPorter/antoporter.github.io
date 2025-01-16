# Microsoft Summer Bootcamp Recap - Day 2

## Microsoft Purview Data Security for Microsoft 365

**Speaker**

- Tim Addison - Cloud Solutions Architect
    
- Callum Lowe - Sr Customer Success Account Manager
    

**Key Notes**

**Agenda for the session**

- Data Security: Concepts & Scenarios
    
- How to get started in Purview
    
- How Microsoft can help
    

**Data Security**

**Scenarios**

1. **User account is compromised and used to exfiltrate highly sensitive information**
    
    - Phishing Attack, Harvesting and Exfiltrating Data for financial benefit.
        
2. **AI Generated content containing sensitive information is inappropriately distributed**
    
    - Copilot accidentally passes sensitive information onwards.
        
3. **A Malicious internal user sends valuable information to their personal email address**
    
    - Disgruntled user, looking to email their personal email.
        

**Information Management Concept Pillars**

- **Know Your Data** - Understand your data landscape and identify data across your hybrid landscape.
    
- **Prevent Data Loss** - Prevent accidental oversharing of sensitive information.
    
- **Protect your Data** - Apply flexible protection actions including encryption.
    
- **Govern your Data** - Automatically retain, delete, and store data and records in a compliant manner.
    

**Scenario 1 - User account is compromised and used to exfiltrate highly sensitive information**

- **Business Analysis Comes First**
    
    - What is your most sensitive information?
        
        - e.g. Customer Information
            
    - How can we Identify the Information?
        
        - e.g. 'Customer Number and Customer Name' OR Customer Name
            
- **Know Your Data**
    
    - Content Matching Methods which can be used to "Know Your Data" pillar:
        
        - Sensitive Information Type
            
        - Trainable Classifier
            
        - Exact Data Match
            
        - Document Fingerprint
            
    - Context Matching Methods which can be used to "Know Your Data" pillar:
        
        - Sensitivity Label
            
        - Retention Label
            
        - Document Property
            
        - Metadata
            
- **Prevent Data Loss**
    
    - Data Loss Prevention, Define the properties configured during your "Know Your Data" definition.
        
        - Actions which can be configured include "Block Users from receiving email" etc. This can also be configured to Block email for External only as an example also.
            
        - Simulation Mode determines how many "hits" it gets before enabling.
            
    - "A Good DLP configuration will never trigger as a result of a Business Process"
        
        - Configure exceptions into your DLP via policy conditional.
            
            - These should be discovered and considered during Business Analysis component
                
        - Volume Refinement: A low number of occurrences may be common business process, a high number of occurrences may be an indication of exfiltration
            
        - Staged Policy Implementation (recommendation from Tim Addison)
            
            - 1. Report Mode - Ensure your DLP is collecting the information relevant to "Know Your Data"
                    
            - 2. Warn Mode - Identify false positives or legitimate use that may be blocked
                    
            - 3. Block Mode - When risk of disruption has been mitigated, policy action can be set to block
                    

**Scenario 2 - AI Generated content containing sensitive information is inappropriately distributed**

- **General Info:**
    
    - DLP Policy Tips: can be configured to warn a user when the item they are working with matches a DLP policy condition.
        
        - "This has company information, you may want to consider emailing this externally"
            
    - Sensitivity Label:
        
        - "Your instructions contain one or more sensitive files, referencing them may update the sensitivity of the document to match".
            
    - DLP Policy:
        
        - "Prevent Sensitivity Label from being sent externally"
            
- **Prevent Data Loss**
    
    - Prevent copilot from interacting with sensitive files
        
        - Labels can be configured to apply encryption
            
        - Encryption can be configured to block copilot access
            
    - Prevent labelled items in copilot prompts
        
        - DLP policies can be configured to prevent copilot from processing items with certain sensitivity labels.
            

**Scenario 3 - A Malicious internal user sends valuable information to their personal email address**

- **Insider Risk Management - Intelligently detect and mitigate the most critical risks**
    
    - Privacy - protect user trust and build a holistic insider risk program with pseudonymization and stronger privacy controls
        
    - Simplicity - Identify hidden risks with 100+ built in machine-learning models and indicators, requiring no endpoint agent
        
    - Acceleration - Expedite mitigation with enriched investigations and Adaptive protection that enforces DLP controls dynamically
        
- **Insider Risk Management to prevent data theft**
    
    - Prioritize content type e.g. Sensitive Information Types, Sensitivity Labels, File Extensions etc.
        
    - Indicators e.g. Office Indicators like Downloading Contents from OneDrive, Syncing Contents to OneDrive etc.
        
- **Insider Risk Management - Adaptive Protection (Risk Score Explained)**
    
    - Detects high impact users
        
    - Downgrades sensitivity label on unusual volume of SharePoint files prior to downloading
        
    - Submits Resignation
        
        - Scales into Medium Risk from Low, Medium Risk Adaptive Controls Apply
            
    - Tries to print confidential files
        
    - Tried to copy same files to a USB
        
        - Scales into High Risk from Medium, High Risk Adaptive Controls Apply

**How to Get Started:**

1. Establish a sensitivity label taxonomy
    
2. Configure sensitivity labels and publish to users
    
3. Establish a data security framework that defines your information protection requirements
    
4. Determine how to identify most sensitive information assets
    
5. Configure DLP policies to protect highly sensitive information
    
6. Configure DLP policies to protect your higher sensitive labels
    
7. Enable IRM analytics to start scanning for potential malicious user activity
    
8. Create IRM policies targeting suspicious activities around sensitive items
    
9. Help to ensure label accuracy by automatically applying or recommending labels when sensitive content is detected
    
10. Label items at rest in SharePoint based on locations or emails during transit


---

## How to apply data security across both structured and unstructured data

**Speaker**

- Richard Lee - Snr. Azure Data & AI Specialist
    
- Beau Faull - Technology Specialist, Security, Risk and Compliance
    
- Nelson Yuen - Senior Compliance Global Black Belt
    

**Key Notes**

- "Securing data is complex and multi-faceted"
    
    - Different types of data, users and objectives
        
    - AI transformation brings data risk
        
    - Regulations continue to evolve
        
- Best-In-Class Classification Technologies (Microsoft Purview)
    
    - Sensitive Information Types - 200+ Out-of-the-box info types for use.
        
    - Named Entities - 50+ entities cover examples names, medical terms, and drug names
        
    - Exact Data Match - Provides a lookup to exactly match content
        
    - OCR - Expand OCR for EXO, SPO, ODB, Team and Endpoint Device
        
    - Trainable Classifiers - 35+ Pre-Trained Classifiers.
        
    - Credentials SITs
        
    - Fingerprint SITs
        
- Todays Data Realities
    
    - What data do I have?
        
    - Is it trustworthy?
        
    - Can people access the data needed to make the right decisions?
        
    - How can I enable faster business insights?
        
    - What is my compliance exposure?
        
- Unify analytics and governance with Microsoft Fabric and Microsoft Purview
    
    - Microsoft Fabric - Reshaping how you access, manage, and act on data and insights by connecting every day data source and analytics service together in Fabric.
        
    - Microsoft Purview - Keep your data safe and governed with unified data governance, information protection, and risk and compliance solutions.
        
- Use Purview security and compliance features to protect your data in OneLake
    
    - Information Protection Labels for Fabric - Classify sensitive fabric data using the same sensitivity labels that are used in Microsoft 365
        
        - Manually label fabric items with organizations sensitivity labels, used in Microsoft 365 apps.
            
            - This is on the Roadmap to be Automated.
                
    - Data Loss Prevent Policies - Automatically detect the upload of sensitive data such as PII and trigger automatic risk remediation actions such as alerts.
        
        - Automatically detect the upload of sensitive data, supporting trigger alerts for admins and custom policy tips to data owners.
            
        - Data owners can provide feedback using report a false positive action.
            
    - Audit - Log user activities from Microsoft Fabric to support security, forensic and internal investigations.
        
        - Support forensic investigations, preserve audit logs to meet regulatory requirements and gain high-bandwidth access to data
            
        - Microsoft Fabric user activities are logged and available in the Microsoft Purview audit log.
            
        - Use Fabric admin monitoring workspace to explore audit logs in Purview.

---

## Cyber Incident Response

**Speaker**

- Ben Ackerman - Senior Specialist, Global Black Belt, Microsoft Unified
    
- Aabir Quazi - Senior Security Researcher - Detection and Response Team (DART)
    

**Key Notes**

- **Notable Attacks and Information in Recent History**
    
    - Feb 2024 - Ransomware attack on US Healthcare system.
        
    - Data Breach in 2022 to an Australian company has cost $126 Million over the past 3 years.
        
    - Attackers target Applications, Infrastructure (servers and networking), People (phishing), to gain the Data they wish to obtain.
        
    - In a Recent IBM Report - Global Average breach was $4.3m US
        
    - "The harsh reality is cybercriminals will continue to attack"
        
- **Microsoft provide a Microsoft Security incident response service.**
    
    - Hourly based agreement
        
    - Proactive and Reactive Service
        
    - Prepare Proactively for Future Attack.
        
    - Work closely with Microsoft Threat Intelligence teams.
        
    - Collaborate with Private Sectors and Government Agencies, around the world.
        
- **Cybersecurity Incident Response Approach**
    
    - **Investigation** - Complete investigative service, determine whether systems are under target exploitation, set the groundwork recovery process of evicting the attack from the environment
        
        - Investigation of Windows environments including workstations, servers and domain controllers, as well as Investigating Entra ID and O365, including O365 Tenants and Entra ID (AAD)
            
            - Deliverables include Outbrief Report, Outbrief Presentation, timeline report and power BI tool, showing technical information concerning the findings from the FENNEC scanner.
                
    - **Containment** - Deploy immediate countermeasures to contain active attacks and restore critical identity systems impacted by ransomware
        
    - **Recovery** - Take back control of the environment, removing attackers top tier privileges, deploy baseline controls
        
    - **Modernization** - Long-term architecture and process changes and Zero Trust and IR planning roadmap
        
        - DART often takes 3 weeks for Investigate-Containment-Recovery, where this process is longer term.
            
    - **Pre-Incident Services: Compromise Assessment**
        
        - Scope Includes:
            
            - Investigation - Leverage the experience and expertise of Microsoft Incident response professionals
                
            - Analyze - Compare organizations needs with the state of the environment
                
            - Manage - Improve your ability to respond effectively to risk in a consonantly evolving landscape
                
        - Assessment Deliverables:
            
            - Scope (Determine the level of effort in weeks)
                
            - Kickoff (Deploy defender and validate connections)
                
            - Analysis (Perform assessments on data collection)
                
            - Brief (Present an Executive Summary of the Findings)
                
            - Remediate (Work with to identify Microsoft services and products to help address security challenges)
                
    - **Tooling and Methodology**
        
        - **Point in Time Deep Scan**
            
            - **Fennec** - Proprietary IR tooling for Windows (IR Only)
                
            - **LiFE** - Proprietary IR tooling for Linux (IR Only)
                
            - **FoX** - Forensic triage tool on devices of interest
                
            - **Arctic** - Active Directory security and configuration scan
                
            - **Cosmic** - Entra ID security and configuration scan
                
        - **Continuous Monitoring**
            
            - Microsoft Sentinel - Centralized event logging
                
            - Microsoft Defender for Endpoint - Behavioral process-level detection
                
            - Microsoft Defender for Identity - Detection of common threats, analyzes authentication requests
                
            - Microsoft Defender for Cloud Apps - Analysts of cloud workloads to combat cyberthreats
                
        - **Sensor Intelligence**
            
            - Custom Threat Intelligence - Based on data from Microsoft's global sensor network and Microsoft Threat Intelligence team
                
        - **Attack Containment**
            
            - Microsoft Incident Response can and will take direct and decisive action against ongoing actor activity to disrupt and limit damage activities based on IOCs gathered from the engagement
                
    - **Key Work Products**
        
        - Out-Brief presentation covers:
            
            - Executive overview and threat level summary
                
            - Detailed findings, including attack activity and timeline (if applicable)
                
            - Recommendations for short term and long term steps to improve overall security posture
                
        - A Power BI report, covering:
            
            - Identity drilldown including state of OnPrem AD and Entra ID
                
            - Endpoint drilldown, based on machines scanned
                
            - Security Posture Management (OnPrem and Entra ID)
                
            - Commonly Exploited Third Party Applications

---

## AI ready Infrastructure

**Speaker**

- Andrew Orange - Product Manager Azure Infrastructure
    

**Key Notes**

- **AI Transformation Opportunities**
    
    - Enrich employee experiences
        
    - Reinvent customer engagement
        
    - Reshape business process
        
    - Bend the curve on innovation
        
- **Azure Components**
    
    - AI Organization and toolchain
        
    - Foundation Models
        
    - Your Data
        
    - AI Infrastructure
        
- **Copilot and AI Stack**
    
    - AI Platform
        
    - App Services
        
    - Data Services
        
    - AI Infrastructure
        
- **Cloud Infrastructure for the era of AI**
    
    - **Powerful** - Purpose built platform for all workloads
        
        - AI Enhanced Apps - Intelligent apps for optimal latency and better enhancements with AI
            
        - Your Data - Modernized data for seamless integration into your models
            
        - Foundation Models - Widest Model Choice with Lowest Cost
            
        - AI Infrastructure - Agility to run on purpose-built infrastructure for fastest AI performance
            
    - **Realize AI Ambitions at scale with Azure**
        
        - 75% - agree that migrating to the cloud was essential to AI and ML adoption
            
        - 81% on Azure - Agility to change and improve AI
            
        - 77% on Azure - Ease to innovate with AI in Current Environments
            
    - **Infrastructure that's optimized end-to-end**
        
        - Datacenters - Enterprise grade datacenters and secure by default with built-in resiliency features for high availability
            
        - CPU - Powerful performance to meet requirements across any workloads
            
        - AI Accelerator - Handle Complex AI tasks faster with energy efficient AMD, NVIDIA, and Microsoft's Maia accelerators
            
        - Network - Run large scale AI workloads with high bandwidth, low latency InifiBand and Ethernet based networking topologies
            
    - **Secure** - Foundational security to cloud-native security solutions
        
        - **Challenges**
            
            - Multicloud Compliance
                
            - Infrastructure as Code
                
            - Security should not slow down developers.
                
        - **Azure Security is Built-In vs Bolted On**
            
            - Microsoft Defender for Cloud
                
            - Microsoft Sentinel
                
            - Azure Network Security
                
            - Confidential Computing
                
            - GitHub Advanced Security
                
            - Copilot for Security
                
        - **Secure Workloads**
            
            - Compute - Enable Multicloud protection
                
            - Databases and Storage - Minimize risk proactively
                
            - Service Layer - Reduce threat mitigation time by 50%
                
    - **Adaptive** - Multicloud, hyperscale edge; cloud operations and management
        
        - Azure spans from hyperscale to edge to IoT with an adaptive cloud approach
            
            - Migrate and Modernize apps, data, and Infrastructure
                
            - Migrate VMware as is
                
            - Extend to Hybrid Multicloud and Edge
                
        - **Operate with AI-Enhanced Central Management**
            
            - Microsoft Copilot for Azure
                
            - Azure Monitor
                
            - Microsoft Defender for Cloud
                
        - **Rapidly Develop and Scale Applications Across Boundaries**
            
            - Visual Studio
                
            - GitHub
                
            - Azure Kubernetes Service
                
        - **Cultivate data and Insights across physical operations**
            
- **Top Takeaways**
    
    - Migration to Azure is the first step to achieve AI Readiness
        
    - Get powerful compute and run on the largest cloud network on the planet for optimal availability, scalability, and resiliency.
        
    - Azure secures your workloads across the migration journey
        
    - Azure supports a diverse ecosystem of applications and services through a single pane of management for your entire estate
        
    - Azure is adaptive, meeting you where you are in the cloud journey

---

## Unlock Value from Your Data with Analytics

**Speaker**

- Fabio Braga - Senior Data & AI Specialist
    

**Key Notes**

- **Agenda**
    
    - The opportunity with data and AI
        
    - The challenges stifling digital transformation
        
    - Introducing Microsoft Fabric
        
    - Unifying your analytics on a complete, governed platform
        
    - Establishing a trusted data foundation
        
    - Empowering everyone with insights
        
    - Fueling your AI Innovation
        
    - Getting Started
        
- **The opportunity with data and AI**
    
    - 87% of Organizations believe AI will give them a competitive edge (Source: MIT Sloan Management Review)
        
- **The challenges stifling digital transformation**
    
    - **"The Starting Line"**
        
        - Data copies and infrastructure inefficiencies
            
        - Limited interoperability between vendor services
            
        - Data exposure risk
            
    - **"The Finish Line"**
        
        - A Unified, Intelligent data estate built on an open and governed data lake house
            
- **Introducing Microsoft Fabric**
    
    - Microsoft Fabric includes the following services and components:
        
        - Data Factory
            
        - Data Engineering
            
        - Data Warehouse
            
        - Data Science
            
        - Real-Time Intelligence
            
        - Power BI
            
        - Copilot in Fabric
            
        - OneLake
            
        - Microsoft Purview
            
- **Unify your analytics on a complete governed platform**
    
    - **"The Starting Line"**
        
        - Data copies and infrastructure inefficiencies
            
        - Limited interoperability between vendor services
            
        - Data exposure risk
            
    - **Unify your analytics on a complete platform with Fabric**
        
        - Empower every data professional with the right tools
            
        - Manage, Secure and govern your data in Fabric
            
        - Simplify billing with unified compute
            
    - **Manage, Govern, and Secure data at scale in Microsoft Fabric**
        
        - **Manage your data estate**
            
            - Admin Portal
                
            - Tenant and Workspace Settings
                
            - Capabilities
                
            - Domains and Subdomains
                
            - Workspaces
                
            - Metadata Scanning
                
        - **Secure, Protect & Comply**
            
            - Fabric inbound and outbound security
                
            - Conditional Access
                
            - Fine-Grained security and access controls
                
            - Workspace & Item Security
                
            - Data Encryption
                
            - Certificates & Standards
                
            - Data residency
                
        - **Encourage data discovery, trust and use**
            
            - OneLake data hub
                
            - Endorsements
                
            - Data lineage & impact analysis
                
            - External data sharing
                
            - Metadata curation
                
            - Discover & reuse
                
        - **Monitor, uncover insights and act**
            
            - Admin monitoring
                
            - Capacity metrics
                
            - Monitoring Hub
                
            - Purview Hub
                
    - **Microsoft Fabric Business Model Overview**
        
        - Compute: Data Factory, Data Engineering, Data Warehouse, Data Science, Real-Time Intelligence, Power BI, Copilot in Fabric
            
        - Storage: Unified Data Foundations (OneLake)
    
- **Establish a Trusted Data Foundation**
    
	- **"The Starting Line"**
	    
	    - Data Duplication and Movement
	        
	    - Access issues hindering data exploration and analysis
	        
	    - No central data catalog
	        
	- **Expectations of data lakes vs reality**
	    
	    - **Expectations**
	        
	        - One place for an organization to land all data, structured and unstructured.
	            
	        - Break down data silos, making it easier to blend and analyze data together
	            
	        - Simplify security, governance and data discovery enabling all users and applications to access the data they need
	            
	    - **Reality**
	        
	        - **You buy storage and build a complicated lake solution on top of it**
	            
	        - Getting the desired value from one Data Lake is hard. Business groups get frustrated with the pace of change when having to coordinate through a central team.
	            
	        - Shifting to a data mesh pattern enables business groups to work independently with multiple business domain-driven lakes. However, it requires each team to manage their own lakes.
	            
	- **OneLake for all data - "The OneDrive for Data"**
	    
	    - Connect to data from across your multi-cloud estate - Easily connect to data across clouds using "Shortcuts" to virtualize data in OneLake without having to move or duplicate the data.
	        
	    - Work from the same copy of data across engines - Load data of any format into the open data lake one time and access that single copy across any Fabric analytics engine.
	        
	    - Responsibly democratize data access - Intuitively organize your data in Microsoft Fabric's data lake, OneLake, for central data discovery, sharing, governance, and compliance.
	        
	- **Connect to data across clouds using shortcuts and mirroring.**
	    
	- **A Single unified SaaS data lake - "No Silos"**
	    
	    - Provisioned Automatically with the tenant
	        
	    - Any data in OneLake works with out-of-the-box governance such as data lineage, data protection, certification, catalog integration, etc. All data is ultimately under the control of a tenant admin
	        
	    - OneLake enables distributed ownership. Different workspaces allow different parts of the organization to work independently while still contributing to the same data lake. Each workspace can have its own administrator, access control, region, and capacity for billing.
	        
	- **OneLake for all domains - True Data Mesh as a Service.**
	    
	    - Logically group together all data in an organization relevant to an area of field, according to business needs with domains.
	        
	    - Domains are defined with domain admins and contributors who can associate workspaces and group them together.
	        
	    - Domains simplify discovery and consumption of data across the organization, allowing business-optimized consumption.
	        
	    - Avoid data swamps by endorsing certain data as certified or promoted, thus encouraging reuse.
	        
	- **OneLake which logically spans the world.**
	    
	    - To achieve data residency requirements, workspaces can reside in different regions around the world, while still being part of the same data lake.
	        
	    - Data can reside in different regions without the overhead of managing different storage resources and without creating data silos.
	        
	    - OneLake provisions storage resources for each workspace to meet demands for scale.
	        
	    - Underlying physical storage is virtualized away.
	        
	    - All storage is zone redundant by default with an option for Geo redundancy.
	        
	- **One Copy for all computes - Real separation of compute and storage**
	    
	    - All the compute engines store their data automatically in OneLake as data items.
	        
	    - The data is stored in a single common format.
	        
	    - **Delta Parquet**, an open standard format, and it is the storage format for all tabular data in Fabric.
	        
	    - All the compute engines have been fully optimized to work with the **Delta Parquet** as their native format.
	        
	    - Once data is stored in the lake, it is directly accessible by all the engines without needing any import/export.
	        
	    - You're able to choose the right engine for the job.
	        
	    - All compute engines have been fully optimized to work with **Delta Parquet** as their native format.
	        
	    - Shared universal security model is enforced across all the engines (Coming Soon).
	        

**Empower everyone with Data and Insights**
	
- **Frontline Workers** - Lack of data insights and history around daily tasks lead to less optimal decision making.
    
- **Data Analysts** - Fragmented data sources prevent a complete, contextualized view and inhibit the creation of insights.
    
- **Line of Business Leaders** - Complex dashboard and multi-source data integrations with long lead times make it difficult to stay up to date on KPIs.
    
- **CxO** - Digital transformation is slowed without usable tooling and technology that minimizes instinct-driven decisions.
    
- **Empower every business user**
    
    - Reduce data duplication and provide real-time insights - Save time for analysts and provide up-to-date insights with Direct Lake mode, a blazing fast, real-time connection to your data in OneLake.
        
    - Act on insights in real-time - Easily set up a system of detection over your real-time data, alerting business users when they need to act.
        
    - Embed insights in the apps people use every day - Foster a data-driven culture by seamlessly and securely embedding insights into Teams, Excel, PowerPoint, Outlook, and more with native integration.
        
- **Power BI: The Bridge between data and decisions**
    

**Fuel your AI Innovation**
	
- **Accelerating Productivity with Copilot in Fabric** - Stay focused on unlocking value from your data with built-in generative AI experiences.
    
- **AI Driven Insights** - Uncover deeper insights and drive action faster with best-in-class AI models.
    
- **Generative AI on Your Data** - Create custom generative AI experiences, grounded on your data.
    
- **Copilot in Microsoft Fabric**
    
    - Data Factory - Get intelligent code generation to transform data with ease and code explanations to help you better understand complex tasks.
        
    - Data Engineering and Data Science - Quickly generate code in Notebooks to help work with Lakehouse data and get insights.
        
    - Data Warehouse - Write and explain T-SQL queries, or even make intelligent suggestions and fixes while you are coding.
        
    - Real-Time Intelligence - Translate questions into KQL queries that you can execute.
        
    - Power BI - Quickly create report pages, natural language summaries, and generate synonyms.
        
        - Create insightful reports by chatting with Copilot.
            
        - Define metrics and calculations for your data model by describing them in Natural Language.
            
        - Use Copilot to find and summarize insights in your data.
            
- **Generative AI on your data**
    
    - Enable custom Q&A on your data in Fabric.
        
    - Define custom business semantics and grounding unique to your organization.
        
    - Scale the custom experiences to Microsoft 365 Chat, Copilot Studio, and Azure AI Studio.
        
    - **Build Your Own GenAI Experience**
        
        - Enhance data insights - Build enterprise chat applications to uncover insights using natural language from structured, unstructured, and real-time data.
            
        - Analyze customer interactions - Build speech analytics applications to enhance customer service, tailor support responses, and make data-driven decisions.
            
        - Customize machine learning models - Train, deploy, and orchestrate machine learning models tailored to specific business needs, from predictive maintenance to customer sentiment analysis.
            
    - **Fuel the AI journey by getting data AI ready**
        
        - Establish a central repository for all data (using OneLake) - Integrate disparate data sources into a unified data platform and data lake.
            
        - Prepare data for AI Innovation (Using Microsoft Fabric data experiences) - Improve the quality of your data, to ensure it is complete, accurate, and governed.
            
        - Build generative AI experiences on top of your data (using Azure AI Studio) - Enhance the breadth and depth of data-driven experiences by creating an AI solution.
            

**Getting Started**
    
- Try Microsoft Fabric for 60 days free: [aka.ms/try-fabric](https://aka.ms/try-fabric)
    
- Join the vibrant Fabric community: [aka.ms/fabric-community](https://aka.ms/fabric-community)
    
- Learn more about Fabric with Microsoft's Technical blog site: [blog.fabric.microsoft.com/en-US/blog](https://blog.fabric.microsoft.com/en-US/blog)
    
- Read the Projected Total Economic Impact of Microsoft Fabric: [aka.ms/Fabric-ForresterTEI-2024](https://aka.ms/Fabric-ForresterTEI-2024)
    
