# IT Security Fundamentals

This section consolidates key concepts from **ISC2 CC Domain 1** and **CompTIA Security+**.  
It is designed as a **study guide for certification candidates** and a **teaching resource**.

---

## Purpose
- Provide clear, organized notes on core cybersecurity concepts.  
- Support students preparing for exams such as LSC2 CC and CompTIA Security+.  
- Showcase structured materials for academic reviewers and classroom use.  

---

## 1. Foundations of Security

### Information Security vs IT Security vs Cybersecurity
<img src="../images/info_vs_it_vs_cybersecurity.png" alt="InfoSec vs IT Security vs Cybersecurity" width="300"/>

- **Information Security (InfoSec)**: Protects all forms of information e.g. paper, voice, digital, and human knowledge.
- **IT Security**: Focuses on hardware, software, networks, and data being processed, stored, or communicated.  
- **Cybersecurity**: Subset of IT Security, i.e. protecting systems and data accessible via the internet.

**Key takeaway**: Cybersecurity ⊂ IT Security ⊂ Information Security.

---

## 2. CIA Triad

The **CIA Triad** is the cornerstone of security:

<img src="../images/cia_triad.png" alt="CIA Triad" width="450"/>

- **Confidentiality**  
  - Ensures sensitive data is accessible only to authorized users.  
  - Techniques: Access controls, encryption (AES256, SSL/TLS), secure communication, policies, training.  
  - Example: Protecting customer payment data with TLS and multi-factor authentication.  

- **Integrity**  
  - Ensures data remains accurate, consistent, and trustworthy.  
  - Techniques: Hash functions (SHA‑256), checksums, digital signatures, access controls.  
  - Example: Detecting unauthorized changes in a file via hash mismatch.  
  - Case Study: *Stuxnet worm* altered centrifuge operations by subtly changing data integrity.  

- **Availability**  
  - Ensures authorized users can access data/systems when needed.  
  - Techniques: Redundancy (RAID, backup servers), fault tolerance, patch management, disaster recovery plans.  
  - Example: E-commerce site uptime (99.9% SLA) maintained via redundant servers.  

---

## 3. Opposite of CIA: DAD Triad

The **DAD Triad** represents threats that undermine CIA principles:

<img src="../images/dad_triad.png" alt="DAD Triad" width="450"/>

- **Disclosure** → Breach of confidentiality (unauthorized access).  
- **Alteration** → Loss of integrity (unauthorized changes).  
- **Destruction/Denial** → Attack on availability (data deletion, DDoS, hardware damage).  

---

## 4. Three States of Data

Data exists in three states, each requiring protection:

<img src="../images/data_states.png" alt="Three States of Data" width="650"/>

- **Data at Rest**: Stored on disk/tape → must be encrypted.  
- **Data in Motion**: Transmitted across networks → use end-to-end encryption (TLS, IPSec).  
- **Data in Use**: Actively processed → protect via policies (clean desk, screen locks, shoulder surfing prevention).  

---

## 5. IAAA Model

The **IAAA model** expands on the traditional AAA (Authentication, Authorization, Accounting) by explicitly including **Identification**.  
Together, these four pillars provide a structured approach to secure access and accountability in IT systems.

---

### Identification
- **Definition**: The process where a subject (user, program, or device) claims an identity.  

<img src="../images/identification-card.png" alt="Identification" width="450"/>

- **Examples**: Username, ID number, employee number, Social Security Number.  
- **Concept**: Essentially stating, *“I am [Name/ID].”*  
- **Techniques**: User IDs, smart cards, employee numbers.  
- **Important Note**: Identification alone does **not** prove identity — it only claims it.  
  - Must always be followed by **Authentication** to verify the claim.  
  - Shared or reused identifiers (e.g., generic accounts) weaken accountability.

---

### Authentication
- **Definition**: Verifying the claimed identity before granting access.  

<img src="../images/authentication_factors.png" alt="Authentication" width="450"/>

- **Factors of Authentication**:  
  - **Something you know (Type 1)** → Passwords, passphrases, PINs.  
    - Also called *knowledge factors*.  
    - Weakest form of authentication: easier to guess or steal than breaking encryption.  
  - **Something you have (Type 2)** → ID, passport, smart card, token, cookie on PC.  
    - Also called *possession factors*.  
    - The subject uses these to authenticate their identity: if they have the item, they must be who they say they are.  
  - **Something you are (Type 3)** → Biometrics such as fingerprints, iris scans, facial geometry.  
    - Also called *realistic authentication*.  
    - Most secure but costly and error‑prone (false accepts/rejects).  
    - **Issues with Biometric Authentication**:  
      - Must respect and protect employee privacy.  
      - Physiological data (fingerprints, iris, DNA) can reveal sensitive health or genetic information.  
      - Behavioral biometrics (typing rhythm, voice, gait) may expose neurological conditions.  
      - Unlike passwords or tokens, biometrics cannot be replaced if compromised.  
  - **Somewhere you are** → Geolocation/IP-based checks.  
    - Uses the subject’s physical or network location to verify identity.  
    - Examples: GPS coordinates, IP address ranges, or network location restrictions.  
    - Often combined with contextual access control (e.g., only allowing logins from corporate offices or specific countries).  
    - Limitation: can be bypassed with VPNs or IP spoofing if not paired with stronger factors.  
  - **Something you do** → Behavioral biometrics like typing rhythm or signature.  
    - Relies on unique behavioral patterns that are difficult to mimic consistently.  
    - Examples: keystroke dynamics, mouse movement, walking gait, voice cadence.  
    - Advantage: adds continuous authentication (system can monitor behavior during a session).  
    - Limitation: behavior can change due to stress, fatigue, or injury, so thresholds must be tuned carefully.  

- **Best Practice**: Use **Multi-Factor Authentication (MFA)** combining two or more independent factors.
---

### Authorization
- **Definition**: Authorization determines what an authenticated user is permitted to do by establishing their rights and privileges.  
- **Mechanisms**: Enforced through **permissions and privileges** (read, write, execute, delete, modify) and **Access Control Lists (ACLs)**, which match user credentials against permitted actions.  
- **Principles**:  
  - **Least Privilege** → Users/systems are granted only the minimum access necessary to perform their tasks, reducing attack surface.  
  - **Need-to-Know** → Even if a user has access, they should not use it unless their role requires it. Prevents unnecessary exposure of sensitive data.  

---

#### Access Control Models
- **DAC (Discretionary Access Control)**  
  - Access is at the discretion of the object owner.  
  - Common in operating systems where file owners assign rights.  
  - Often used when **availability** is prioritized.  
  - Weakness: susceptible to privilege creep if owners grant excessive rights.  

- **MAC (Mandatory Access Control)**  
  - Access is based on **security labels** (e.g., Confidential, Secret, Top Secret) and subject **clearances**.  
  - Common in military and government environments where **confidentiality** is critical.  
  - Strong enforcement: subjects cannot override labels.  
  - Example: A subject with “Secret” clearance cannot access “Top Secret – Nuclear” data.  

- **RBAC (Role-Based Access Control)**  
  - Rights are assigned to roles (e.g., Manager, Admin, HR). Users inherit permissions through their role.  
  - Simplifies management for large organizations.  
  - Often used when **integrity** is most important.  
  - Supports **separation of duties** and prevents privilege creep.  
  - Example: Payroll clerks can edit salary records, but auditors can only view them.  

- **ABAC (Attribute-Based Access Control)**  
  - Grants access based on attributes of the **subject** (user role, clearance), **object** (resource type, owner), and **environment** (location, time, threat level).  
  - Policy‑based and highly flexible.  
  - Example: A doctor can access patient records only during working hours and only for patients assigned to them.  

- **Context-Based Access Control**  
  - Access depends on contextual parameters such as location, time, sequence of responses, or access history.  
  - Example: Login allowed only from corporate IP ranges during business hours.  

- **Content-Based Access Control**  
  - Access is determined by the attributes or content of the object itself.  
  - Example: Database views hide sensitive fields (e.g., SSN) unless the user has explicit clearance.  

---

### Exam Insights
- DAC → Availability focus, flexible but weaker security.
- MAC → Confidentiality focus, strict enforcement with labels/clearances.
- RBAC → Integrity focus, scalable and role-driven.
- ABAC → Flexible, policy-based, combines subject, object, and environment.
- Least Privilege & Need-to-Know → Core principles across all models.

---

### Accounting (Auditing)
- **Definition**: Tracking user activities and resource usage within a system.  
- **Techniques**:  
  - Audit trails and logs (login times, session duration, file access, system changes).  
  - Monitoring across servers, firewalls, routers, and applications.  
- **Purpose**: Provides evidence for accountability, supports non‑repudiation, and enables auditing of user actions.

---

### Accountability
- **Definition**: Accountability ensures that individuals or entities are held responsible for their actions within a system.  
- **Core Idea**: Every action must be traceable back to a specific identity, preventing denial or misuse.  
- **Mechanism**: Achieved through **auditing** and **logging** of user activities, combined with proper identification, authentication, and authorization.

---

#### Key Components
- **Accounting (Auditing)**  
  - Tracks user activities such as login times, file access, modifications, deletions, and system changes.  
  - Audit trails and logs provide detailed evidence of actions performed.  
  - Example: Windows Security Logs record when Sam logged in at 9:30, accessed a file at 9:33, and deleted it at 9:38.  

- **Non‑Repudiation**  
  - A user cannot deny having performed a certain action.  
  - Implemented through **digital signatures** and cryptographic binding of identity to data.  
  - Example: Signed emails or transactions prove origin and prevent denial.  
  - Exam Insight: Non‑repudiation combines **authentication** (who did it) and **integrity** (proof data wasn’t altered).  

- **Subject and Object**  
  - **Subject (Active)** → Most often users, but can also be programs or processes. Subjects perform actions.  
  - **Object (Passive)** → Any passive data or resource (files, databases, paper records). Objects are acted upon.  
  - Example: A user (subject) modifies a payroll file (object).  

---

#### Why Accountability Matters
- **Security Enforcement**: Without accountability, malicious actions cannot be traced back to individuals.  
- **Deterrence**: Knowing actions are logged discourages misconduct (like speeding when police are visible).  
- **Compliance**: Required by standards such as ISO 27001, HIPAA, and PCI DSS.  
- **Dependency**: Accountability relies on all prior pillars (Identification, Authentication, Authorization, Accounting). If any fail, accountability breaks.  

---

### Exam Insights
- Accountability = traceability + responsibility.  
- Non‑repudiation = cannot deny action (digital signatures, logs).  
- Shared accounts = zero accountability.  
- Subjects act, Objects are acted upon.

---

### Analogy for Understanding IAAA
Think of IAAA like a secure office building:
1. **Identification** → Telling the receptionist your name.  
2. **Authentication** → Showing your government ID to prove you are that person.  
3. **Authorization** → Your keycard only allows entry to your office, not the server room.  
4. **Accountability** → Security cameras and card-swipe logs record when you entered and left.

---

## 📊 Quiz
Challenge yourself: [IT Security Fundamentals Quiz](../quiz/quiz01-IT_Security_Fundamentals.md)

---

## Author
Created and maintained by **Hesam Abdolhosseini**  