# Threat Modeling: Healthcare Mobile App

## Most Critical Asset

The most critical asset is **patient medical records (Protected Health Information, PHI)**.

**Reasoning using the CIA Triad:**

- **Confidentiality** – Medical records contain highly sensitive personal data (diagnoses, treatments, prescriptions). Unauthorized disclosure violates HIPAA and can cause severe reputational, financial, and emotional harm to patients.
- **Integrity** – Medical decisions are based on accurate records. If records are altered (wrong medication, wrong allergy, wrong test result), patients can receive incorrect treatment, endangering lives.
- **Availability** – Healthcare providers must have timely access to records for emergency care. Unavailable records can delay critical decisions and harm patients.

While messaging and appointments are also sensitive, medical records are the core asset that most directly affects patient safety and regulatory compliance.

---

## STRIDE Threats for "Message Healthcare Providers" Feature

### Threat 1: Spoofing – Impersonating a Doctor or Patient

**STRIDE Category** – Spoofing

**Threat Description** – An attacker gains access to a patient's or provider's account and sends messages pretending to be that person.

**Attack Scenario** – Using stolen credentials from a phishing email, an attacker logs in as a doctor and sends a malicious message to a patient instructing them to take a harmful dose of medication or to share more sensitive data.

**Potential Impact** – Patient confusion, potential medical harm, breach of trust, compromised PHI.

**Likelihood** – Medium (depends on strength of authentication; if MFA is absent, likelihood is higher).

**Suggested Mitigation** – Implement strong multi-factor authentication (MFA) for all accounts. Use digital signatures for provider messages. Monitor for unusual login behavior. Use certificate-based authentication for providers.

---

### Threat 2: Tampering – Modifying Message Content

**STRIDE Category** – Tampering

**Threat Description** – An attacker alters a legitimate message after it is sent, changing its meaning.

**Attack Scenario** – An attacker with access to the message database or a compromised network position modifies a prescription refill message from "Take 1 tablet daily" to "Take 4 tablets daily." The patient follows the altered instructions and suffers an overdose.

**Potential Impact** – Life-threatening medical errors, incorrect treatment, legal liability.

**Likelihood** – Low to Medium (requires access to database or network; lower if proper encryption and access controls are in place).

**Suggested Mitigation** – Use end-to-end encryption with message integrity checks (HMAC or digital signatures). Implement strict database access controls. Use audit logging to detect unauthorized changes.

---

### Threat 3: Repudiation – Denying Sending a Message

**STRIDE Category** – Repudiation

**Threat Description** – A user (patient or provider) denies having sent a message, and the system cannot prove otherwise.

**Attack Scenario** – A doctor sends an incorrect medical instruction via the messaging feature. When the patient complains, the doctor claims their account was compromised or they never sent the message. Without proper auditing and digital signatures, the system cannot confirm the true sender.

**Potential Impact** – Disputes over medical advice, legal liability, damaged trust, difficulty assigning responsibility.

**Likelihood** – Medium (common in systems lacking non-repudiation controls).

**Suggested Mitigation** – Implement digital signatures on all messages. Maintain tamper-evident audit logs with timestamps and user identity. Ensure logs are stored securely and cannot be modified.

---

### Threat 4: Information Disclosure – Intercepting Unencrypted Messages

**STRIDE Category** – Information Disclosure

**Threat Description** – An attacker intercepts messages in transit between the mobile client and the backend, exposing private medical conversations.

**Attack Scenario** – A patient uses the app over public Wi-Fi without a VPN. An attacker on the same network captures the traffic and reads messages about the patient's HIV status or mental health treatment.

**Potential Impact** – Exposure of highly sensitive PHI, emotional distress, discrimination, HIPAA violations.

**Likelihood** – Medium (depends on use of TLS; high if TLS is not enforced or if certificate validation is weak).

**Suggested Mitigation** – Enforce TLS 1.2+ for all communications. Use certificate pinning in the mobile app. Avoid transmitting PHI over insecure channels. Encrypt data at rest in the backend.

---

### Threat 5: Denial of Service – Flooding Messaging System

**STRIDE Category** – Denial of Service

**Threat Description** – An attacker overwhelms the messaging API with excessive requests, making the feature unavailable to legitimate users.

**Attack Scenario** – A malicious actor uses automated scripts to send thousands of message requests per minute to the backend, exhausting server resources. Patients are unable to message their providers during an urgent situation.

**Potential Impact** – Delayed medical care, patient frustration, service downtime.

**Likelihood** – Medium (cloud APIs are common targets; rate limiting may be absent).

**Suggested Mitigation** – Implement rate limiting and throttling on the messaging API. Use Web Application Firewall (WAF) rules to block abusive IPs. Design for horizontal scaling and high availability.

---

## Priority Security Controls for Protecting Patient Data

1. **Strong Authentication and Multi-Factor Authentication (MFA)**  
   This is the first line of defense. Without strong authentication, attackers can impersonate legitimate users and access PHI directly. MFA significantly reduces the risk of credential-based attacks (phishing, password reuse). All patients and providers should use MFA, and providers should use certificate-based or biometric authentication for higher assurance.

2. **Encryption (In Transit and At Rest)**  
   Patient data must be encrypted when transmitted (TLS 1.2+) and when stored (AES-256 for database, file, and backup encryption). This protects against interception and data breaches, and it is a core requirement under HIPAA. Even if an attacker steals data, it remains unreadable without keys.

3. **Role-Based Access Control (RBAC) and Least Privilege**  
   Not all users need access to all patient data. Enforce strict roles (patient, nurse, physician, admin) and grant only the minimum permissions necessary. For example, a nurse may view records but not alter prescriptions, and a patient can only view their own data. This reduces the impact of account compromise and insider threats.

4. **Audit Logging and Monitoring**  
   Every access to patient data should be logged with who, what, when, and why. Use a SIEM or centralized logging solution to detect suspicious activity in real time (e.g., a provider accessing an unusual number of records). Logs must be tamper-proof and retained per HIPAA requirements. This supports non-repudiation, incident response, and forensic investigations.

5. **Security Assessments and Patch Management**  
   Conduct regular vulnerability scanning, penetration testing, and code reviews of the mobile app and backend API. Keep all dependencies (libraries, frameworks, cloud services) patched and up to date. Many healthcare breaches occur through known vulnerabilities that were not patched. Continuous assessment helps identify and fix weaknesses before attackers exploit them.

These controls should be implemented in this order because authentication, encryption, and access control directly reduce the most likely attack paths and are foundational to HIPAA compliance. Audit logging and continuous assessment provide detection and correction capabilities, completing a layered defense.

---

**References:**  
- NIST Special Publication 800-66, "Implementing the Health Insurance Portability and Accountability Act (HIPAA) Security Rule"  
- OWASP Mobile Application Security Verification Standard (MASVS)  
- OWASP API Security Top 10
