# Microsoft Summer Bootcamp Recap - Day 1

## Day 1

### Microsoft Security Innovation

**Speaker:**

- Sarah Young - Principal Security Advocate
    

**Note:**

- Unfortunately, I missed the start due to a broken URL. I believe I only missed the countdown, but I couldn't check as it would infinite loop when I tried.
    

#### Entra Suite:

- Entra Private Access
    
- Entra Internet Access
    
- Entra ID Governance
    
- Entra ID Protection
    
- Entra Verified ID
    

#### Ignite Announcements:

- **Universal Continuous Access Evaluation (CAE)** for Entra Private and Internet Access: Revalidates Authentication Tokens based on Risk.
    
- **Private DNS** in Private Access: Eases the process of onboarding before applying MFA and Conditional Access policy.
    
- **App Discovery** in Private Access: A way to look at OnPrem Apps, onboard into Entra, then create policies to control access.
    

#### Intune:

- Intune has jumped in scale 8 times since March 2020.
    
- **Ignite Announcements:**
    
    - **Resource Explorer Cross Platform:** Explore and search on mass a catalog of device hardware properties, building out non-Windows support.
        
    - **Advanced Analytics Multi Device Query and Remote Actions:** Query multiple devices for detailed analysis using KQL interface.
        
    - **Copilot for Intune KQL Assistance:** Use AI Assistance for building multi-device queries.
        

#### Security Operations Platform:

- Previously, Email and Collaboration, Endpoints, Identities, Apps, Data, and Workloads were all managed and siloed in separate areas.
    
- **"Embracing the 'Assume Breach' Mindset"**
    
- **'Exposure Insights - Initiatives':** Identifies areas to improve and track progress.
    
- **"Prioritizing vulnerabilities with an 'attacker's perspective'"**
    
    - **Attack Surface Map Path:** Shows entities affected and associated vulnerabilities.
        

#### Securing and Governing AI:

- Microsoft is the first and only end-to-end solution to provide Data Security and Compliance, Security Posture Management, and Threat Protection.
    
- **Ignite Announcements:**
    
    - **Data Security Posture Management for AI:** Discover AI usage and data risk, assess oversharing risk, and take recommended actions.
        
    - **Data Loss Prevention for Microsoft 365 Copilot:** Exclude documents with specified sensitivity labels from being summarized or used in response in Microsoft 365 Copilot.
        
    - **Insider Risk Management for Microsoft 365 Copilot:** Detect and respond to anomaly and risky AI usage, including data theft and prompt injection attacks.
        
    - **DSPM for Agents built in Copilot Studio:** Discover AI usage and data risks and receive recommended actions.
        
    - **Insider Risk Management for Agents built in Copilot Studio:** Detect, investigate, and respond to anomaly and risky AI usage.
        
    - **Data Compliance for Agents built in Copilot Studio:** Govern prompts and responses with audits, eDiscovery, retention policies, and non-compliant usage detection and response.
        
    - **Model Governance for Azure AI Model Catalog:** Enables IT teams to sanction models approved for deployment.
        
        - Define what properties of an Azure AI Model can and cannot be deployed via policy.
            
    - **AI Security Posture Management in Microsoft Defender for Cloud:** Inventory AI assets, manage vulnerabilities, and map attack paths for custom AI built on Azure and AWS.
        
    - **AI Compliance and Assessment in Compliance Manager (General Availability):** Guidance to implement control for EU AI Act, NIST AI RMF, ISO 42001 & 23894.
        
    - **AI Reports in Azure AI (General Availability):** Report on project details such as model version, content filtering, and evaluation results to support AI compliance requirements.
        

#### Windows Resiliency Initiative:

- **"After the July Incident 2024"** Microsoft discussed with a range of companies and defined: Easier Windows Recovery, Stronger Security Tools and Drivers, and Reduced Security Complexity Overall.
    
- **Ignite Announcements ([aka.ms/WinWithSecurity](https://aka.ms/WinWithSecurity)):**
    
    - **Windows Resilient Security Platform (Private Preview July 2025):** Run your security solutions as an app in user mode, built outside of Kernel Mode. Flexible API, build EDR/AV outside of Kernel.
        
    - **Quick Machine Recovery (Windows Insider Program early 2025):** Execute targeted fixes from Windows Updates on machines even when Windows is unable to boot.
        
    - **Smart App Control & App Control for Business:** Control what apps can be run, ensuring only verified apps are allowed.
        
    - **Hardening to Windows Hello for Business:** Based on new hardware on Copilot+ PCs. Hardened with extended support for passkeys to protect identity.
        
    - **Administrator Protection:** Standard User Permissions by default, requiring authorization through Windows Hello to elevate before controlling system resources.
        
    - Plus, a range of Windows 11 Security Enhancements.


### Inside Microsoft - Securing Our Enterprise

**Speaker:**

- Mick Dunne - Chief Security Advisor
    

**Key Notes:**

- Security is a defining challenge of our time.
    
- 10x increase in the speed and scale of cyber attacks since 2022.
    
- Microsoft has undergone its own transformation into the Cloud.
    
- Microsoft has announced that security is above all else in terms of updates and the future of Microsoft over feature updates, etc.
    
- **3 Principles of Microsoft Secure Future Initiative:**
    
    - **Secure by Design:** Security comes first when designing any product or service.
        
    - **Secure By Default:** Security protections are enabled and enforced by default, requiring no extra effort, and are not optional.
        
    - **Secure Operations:** Security controls and monitoring will continuously be improved to meet current and future threats.
        
- **Security Governance:**
    
    - **Risk Management:** Proactive approach to identify, assess, and mitigate potential risks.
        
    - **Compliance and Regulatory Adherence:** Compliance programs include regular audits, policy review, and employee training.
        
    - **Incident Response:** A well-defined incident response strategy is critical. Establish teams to detect, analyze, and respond to security incidents.
        
    - **Employee Training:** Regular training and awareness for:
        
        - Recognizing phishing attacks
            
        - Secure password practices
            
        - Data protection
            
        - Simulated phishing campaigns
            
        - All Microsoft FTEs have a performance objective related to security
            
- **Collaboration Initiatives:**
    
    - **Bug Bounty:** Paying people who find flaws in Microsoft products and inform Microsoft.
        
- **Microsoft Operations Teams:**
    
    - **Cyber Defense Operations Centre (24/7):** No.1 Priority - Protect Computing Environment
        
    - Multiple "Red Team" style teams, including AI Focused Red Teams
        
    - **DART (Detection and Response Team):**
        
        - Assessment services to customers to become more resilient
            
        - Help customers who have had a breach, identify how, assist in cleanup, then share insights to help prevent future breaches on a larger scale
            
- **Data and Threat Intelligence:**
    
    - Microsoft synthesizes over 78T signals per day
        
    - 10k Security and Threat Intelligence Experts
        
    - 1m Microsoft Security Customers
        
    - 15k Microsoft Partners

### Securing AI: Understanding Risk and Implementing Defenses

**Speakers:**

- Ana-Gabriela Hernandez - Senior Security Specialist, Global Black Belt
    
- Jay Doyle - Senior Security Specialist, Global Black Belt
    

**Key Notes:**

- New attack surfaces introduce new risks and threats (GenAI New Risks and Threats) including threats such as:
    
    - Prompt Injection
        
    - Jailbreak
        
    - Data Poisoning
        
    - Model Hijacking
        
    - Wallet Abuse
        
- **Microsoft Defender for Cloud:**
    
    - **CSPM + CIEM:**
        
        - Enable Secure Development using AppSec + CI/CD Security to prevent vulnerabilities, misconfiguration, secrets in code, and secure your software supply chain.
            
        - Continuously Reduce Risk by contextualizing and prioritizing security posture management across the entire cloud application lifecycle.
            
        - Remediate threats faster using CWP + CDR for near real-time detection and response for compute and AI workloads, data, and APIs in a unified XDR experience.
            
    - **AI Security Posture Management (Preview):** Strengthen AI posture from code to cloud.
        
        - Gain Visibility and Discover AI Models and Workloads, including Azure Open AI Services, Azure Machine Learning, and Amazon Bedrock.
            
        - Identify AI Stacks, including models, SDKs, and other AI technologies.
            
        - Identify GenAI vulnerabilities and risks in development and runtime.
            
        - Map exploitable attack paths to find direct and indirect exploitable risks to your GenAI service.
            
        - Mitigate risk to sensitive data used across your deployments, including cross-cloud misconfiguration and attack paths across AI pipelines, deployments, and risk to sensitive grounding data.
            
    - **Threat Protection for AI Workloads (Preview):** Protect AI workloads against emerging threats.
        
        - Continuously monitor for malicious activity powered by Microsoft threat intelligence.
            
        - Detect and respond to attacks such as jailbreak attacks, sensitive data exposure, and credential theft.
            
        - Receive contextual security alerts with supporting evidence, including IP Address, Malicious Prompt evidence, and Sensitive information types or credential access.
            
        - Correlate and contextualize malicious events into robust security incidents with XDR and SIEM tool integration.
            
- **OWASP Top 10 for LLM Applications:**
    
    - **LLM01 - Prompt Injection:** Manipulates an LLM through crafty inputs to cause unintended actions.
        
    - **LLM02 - Insecure Output Handling:** Occurs when an LLM output is accepted without scrutiny, exposing backend systems. Misuse may lead to severe consequences like XSS, CSRF, SSRF, Privilege Escalation, or Remote Code Execution.
        
    - **LLM03 - Training Data Poisoning:** Occurs when LLM training data is tampered with, introducing vulnerabilities or biases that compromise security, effectiveness, or ethical behavior.
        
    - **LLM04 - Model Denial of Service:** Attackers cause resource-heavy operations on the LLM, leading to service degradation or higher costs. The vulnerability is magnified due to the resource-intensive nature of LLMs and the unpredictability of user input.
        
    - **LLM05 - Supply Chain Vulnerabilities:** The LLM application lifecycle can be compromised by vulnerable components or services, leading to security attacks. Using third-party datasets, pre-trained models, and plugins can add to vulnerabilities.
        
    - **LLM06 - Sensitive Information Disclosure:** LLMs may inadvertently reveal confidential data in their responses, leading to unauthorized data access, privacy violations, and security breaches.
        
    - **LLM07 - Insecure Plugin Design:** LLM plugins can have insecure inputs and insufficient access controls. This lack of application control makes them easier to exploit and can result in consequences like remote code execution.
        
    - **LLM08 - Excessive Agency:** LLM-based systems may undertake actions leading to unintended consequences. The issue arises from excessive functionality, permissions, or autonomy granted to the LLM-based systems.
        
    - **LLM09 - Overreliance:** Systems or people overly depending on LLMs without oversight may face misinformation, miscommunication, legal issues, and security vulnerabilities due to incorrect or inappropriate content generated by LLMs.
        
    - **LLM10 - Model Theft:** This involves unauthorized access, copying, or exfiltration of proprietary LLM models. The impact includes economic loss, compromised competitive advantage, and potential access to sensitive information.

### Microsoft Ignite 2024 Recap with Aaron Powell

**Speaker:**
- Aaron Powell - Principal Cloud Developer Advocate

**Key Notes:**
- Speaker Titled Presentation: "What I Missed from Ignite 2024"
- "To Summarise... Copilot and Security"

#### Security:
- **Zero Day Quest hacking event ([aka.ms/zerodayquest](https://aka.ms/zerodayquest)):**
  - Closes on the 19th of January 2025
  - In-person attendance event
  - In-person bounty hunting, debugging, and monetary prizes
- **Windows ([aka.ms/WinWithSecurity](https://aka.ms/WinWithSecurity)):**
  - Administrator Protection, Standard User Permissions by default; covered in the first session.
  - Windows Resilient Security Platform (Private Preview July 2025); covered in the first session.
- **Windows 365 ([aka.ms/Windows365Link](https://aka.ms/Windows365Link)):**
  - A Thin Client for accessing Windows
  - A device that has nothing running locally on the device, all operations are within the cloud.
  - After Signing-Out of Windows 365 Link device, the device holds no persistent data.
    - Great for Hot-Desking
- **Security Copilot (BRK307 Session):**
  - SOC Enhancements (Generally Available): Get an overview of user identity information in defender incident summary for quicker resolution of potential security threats.
  - Automated Tasks and Workflow (Generally Available): Integrate Copilot promptbook in logic app workflow directly to automate tasks with AI enrichment.
  - Unified Threat Intelligence (Public Preview): Get a complete view of threats by integrating a wider range of threat intelligence sources, including CVE data and advanced internet data sets.
- **Data Security and AI (BRK321 Session):**
  - Top security and compliance concerns with AI Usage:
    1. Data Oversharing: Users may access sensitive data via AI apps they're not authorized to view or edit.
    2. Data Leak: Users may inadvertently leak sensitive data to AI apps.
    3. Risky Usage: Users use AI apps to generate unethical or high-risk content.
  - Secure and Govern M365 Copilot (covered in the first session):
    - Data Security Posture Management for AI
    - Oversharing Assessments
    - DLP for M365 Copilot
    - Blueprint

#### AI:
- **Azure AI (BRK100 Session):**
  - **Azure AI Foundry Announced:**
    - Unified Access to:
      - Copilot Studio
      - Visual Studio
      - GitHub
      - Azure AI Foundry SDK
    - **Model Catalog:**
      - Foundational Models
      - Open-Source models
      - Task models
      - Industry models
    - Designed to work/integrate with:
      - Azure OpenAI Service
      - Azure AI Search
      - Azure AI Agent Services
      - Azure AI Content Safety
    - **Observability:**
      - Evaluations
      - Customization
      - Governance
      - Monitoring
  - **"Our Customer Commitments":** Latest innovations with same-day access:
    - Flexible Offerings
    - Your data is private and secure
    - Safety is Built-In
    - Enterprise Azure promises
    - Developer-Friendly Integrations
    - Model Choice
- **o1-Preview (Generally Available):**
  - Advanced Reasoning
  - Solves Complex Problems
  - Enhances LLM Capabilities:
    - Logical problem-solving
    - Complex math
    - Scientific inquiries
    - Extended conversations
- **o1-Mini (Preview):**
  - Smaller, Faster Model
  - Excels at:
    - Instruction following
    - Small content operations
    - Code debugging
    - 80% cheaper than o1-preview
- **GPT-4o (2024-08-06) (Preview):**
  - Advanced Multi-Modal Model
  - Text, Audio, Vision
  - 2x faster, 5x throughput (GPT4T)
  - 50% Cheaper input
  - 30% cheaper output (GPT4o)
- **GPT-4o mini (Preview):**
  - Smaller, Faster model
  - Text, Audio, Vision
  - 60% Cheaper than GPT-4o
  - Scoring 82% on MMLU
- **Structured Outputs (Generally Available):** Generate structured data from unstructured data
  - Strict JSON Schema following
  - Applies to GPT-4o and GPT-4o mini, with response formats and function calling
  - (Coming Soon) Older model support via function calling
- **GPT-4o-Realtime-Preview and GPT-4o-Audio-Preview (Public Preview):** Enable low-latency, multilingual speech-to-speech conversations
  - Real-Time Audio Interactions
  - Natural Speech Generation
  - Multilingual Capabilities
- **Agents (Session BRK102):**
  - **Azure AI Agent Service (Coming Soon):** Deploy and scale AI agents with ease
    - Enterprise-grade security
    - Extensive data connections
    - Flexible model selection
    - Rapid development and automation
- **M365 Copilot (Session BRK274):**
  - "The New UI for AI":
    - Business Chat
    - Pages
    - Actions
  - **Copilot Pages:** Starts off like a Chat Instance to formulate your idea(s), expands into a collaborative editing workspace which can be shared, like a Microsoft Loop workspace.
  - **Copilot Actions:** No Code, Prompt Based, AI Workflow
    - **Anatomy of a Copilot Action:**
      1. Request and capture information
      2. Recurrence
      3. Output
      4. Trigger
      5. Custom Prompt
- **Responsible AI (Session BRK329):** Highlighted as a session to watch.

#### Dev:
- **GitHub Copilot (Session BRK141 and BRK152):** Highlighted as a session to watch.
- **GitHub Copilot... for free ([aka.ms/copilot-free](https://aka.ms/copilot-free))**


### AI Spotlight on Australia and New Zealand

**Speaker:**

- Ash KJ - Data & AI Product Lead (Asia)
    

**Key Notes:**

- **Q&A Journey panel style, with organizations around Australia and New Zealand:**
    
    - **Winson Wong - Head of AI & Advanced Analytics @ Probe Group**
        
    - **Jourdan Templeton - Chief Technology Officer & Microsoft Regional Director @ Aware Group**
        
    - **Brett Reedman - Chief Information Officer @ Catholic Healthcare**
        
    - **Ken Porter - Director - Automation and Client Services @ Minter Ellison**
        

#### "What are your organizations' main key takeaways":

- Data Quality is important when developing AI, especially for training the models.
    
- Training and Early Engagement with stakeholders, and investment towards the outcome.
    
- Establishing Trust was key within a Law Firm in 2023:
    
    - Establishing early access and private preview, for non-work purposes, to train and develop skillset.
        
- Establishing Adoption was key within 2024 (for the same Law Firm):
    
    - Rollout to business, elements of use within some client works.
        
    - Generate drafts for legal advice:
        
        - Built within Azure OpenAI in a secure environment for the purpose of.
            
- Establish User-Knowledge Foundations:
    
    - Assisting in building a base knowledge for the use of (proper prompt curating etc.) and identification of the use of ChatGPT and AI.
        
- Establishing a Business problem, building a business requirement, and curating a business solution.
    

#### "What did the organizations do to win the mindset of stakeholders":

- Establishing a business problem to stakeholders, surrounding employee resourcing in the specific case mentioned, and defining how AI can be used to reduce that problem. Also, establish a business case around using AI for doing Shift Worker handover in another example:
    
    - Required a sensible vetting period and full engagement from stakeholders.
        
- Financial Value in supporting an AI, return on investment in the use:
    
    - "Leap of Faith" in aspects related to ROI, as AI in this space is still in its infancy.
        
- Establishing transparency in Governance for the use of AI with Data in mind, risk assessment framework.
    

#### "What is the best data structure strategy to establish before using AI":

- The more specific the prompts and context, guardrails, training data, and governance, the better the outcome:
    
    - Reduces chances of hallucination.
        
- Define proper training data sets for the AI prior to the introduction to Generative AI:
    
    - Understand the Data Sets available to the Generative AI.
        
    - Help users understand what that Data Set includes.
        
    - Define that functionality would be available from the Data Set itself.
        
    - Educate/Train users with prompt crafting, to best establish a meaningful response from the Data Sets:
        
        - Example used for this was within a Knowledge Base for Helpdesk, via Copilot, with Data Sets from their Ticketing System.
            

#### "Are there specific areas where organizations could excel with AI Adoption":

- Misconception that AI is new, Machine Learning has been in the market for years. It's that the perspective from the community has changed.
    
- Two aspects to point to:
    
    - **Regulatory:** Guidelines from Public Sector, Framework for responsible AI use. A range of regulatory bodies (such as CSIRO) have a responsible AI framework to follow also.
        
    - **Adoption:** Balancing solution ideas with organizational management of the solution. e.g., ethical use of AI.
        

#### "Responsible AI Usage, Balancing Innovation with Considerations":

- "The dichotomy for the use of AI would be to slow down and be methodical for the use, be innovative, but methodical."
    
- "The risks associated with misuse and oversharing of data outweigh the use of AI."
    
    - "Just because you Can, doesn't mean you Should."
        
- Undertake and Govern by Ethics and Bias as a Framework before use:
    
    - Ensure abiding by Ethics such as Transparency and Privacy.
        
    - Ensure human oversight.
        
    - Discussing the challenges openly, then balancing it against the use of.
        
- Ensure alignment to Regulations, example of the European framework for AI as a reference, or Algorithm Charter in New Zealand:
    
    - Two Resources Referenced:
        
        - Microsoft AI Security Framework
            
        - CSIRO Responsible AI Network
            
- Provide a mechanism to validate the output from AI:
    
    - Example provided was for Legal Advice, includes the source to where the Legal Advice has come to its conclusion. Also, the ability to explain how the technology has come to its conclusion itself, especially surrounding the use of Generative AI (Transparency).
        

#### "How to stay ahead":

- Research and Collaboration, "Many Hands/Heads = Lighter Work".
    
- Future Proofing and Evaluation Framework.
    
- Lead by the Outcome, Find the Pain Point and resolve it, don't chase the Shiny new thing.
    
- Guide your learnings using the Guidelines for AI Usage.
    
- Introduce efficiencies, collaborate with what works in delivering services and solutions.
    
- Build your relationships with your providers, learn together with your providers.
    
- Define a "hop-on" and "hop-off" point, as technology and services change, be prepared to start something new, and stop something in progress.
    
- Define your Platform, what compliance and regulatory requirements to the business and solutions itself, and
    
- Define your AI Champions within your organization, who will help with Training, Adoption, and Direction.

