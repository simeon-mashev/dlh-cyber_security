# Threat Modeling: Cloud Storage Service

## Attack Surface Mapping

| Entry Point | Description | Risk Level | Rationale |
|-------------|-------------|------------|-----------|
| **Public Link Generation** | Users can create public links to share files without authentication. Anyone with the link can access the file. | **Critical** | No authentication required; link leakage directly exposes sensitive data. Guessing or brute-forcing share URLs can lead to mass data exposure. |
| **File Upload Endpoints** | API and web endpoints for uploading files. | **High** | Uploading malicious files (malware, polyglot files) can lead to stored XSS, server-side request forgery, or malware distribution. Also susceptible to size/type bypass. |
| **Authentication & Session Flows** | Login, password reset, MFA, and session management. | **High** | Compromise of credentials or session tokens grants full access to user files. Credential stuffing, session fixation, and weak password recovery are common attacks. |
| **File Sharing with Other Users** | Features to share files/folders with specific users or groups. | **High** | Authorization flaws may allow unauthorized access to shared content. Privilege escalation or IDOR vulnerabilities can expose other users' files. |
| **File Download Endpoints** | API endpoints for downloading files. | **Medium** | If authorization checks are missing or weak, attackers can download other users' files by manipulating file IDs. |
| **Admin Interfaces** | Administrative panels for user management, system configuration, and monitoring. | **Medium** | If exposed or weakly protected, admin access leads to full system compromise. Often targeted via credential attacks or SSRF. |
| **File Versioning APIs** | Endpoints to retrieve or restore previous file versions. | **Medium** | Versioning may preserve deleted or older sensitive files. Authorization gaps could allow access to old versions containing sensitive data. |
| **Client-side & Server-side Encryption Options** | Toggle encryption settings; key management interfaces. | **Medium** | Misconfiguration or weak key handling can render encryption ineffective, leading to data exposure. |

---

## Problematic Proposal: Storing Encryption Keys in the Database

**Proposal:** Store encryption keys in the same database as the encrypted files.

**Threat Modeling Analysis**

Storing encryption keys alongside encrypted data is a severe security flaw. If the database is breached, the attacker obtains both the encrypted data and the keys needed to decrypt it. This nullifies the encryption protection entirely.

### STRIDE Threats Introduced

| STRIDE Category | Threat Description | Impact |
|-----------------|--------------------|--------|
| **Information Disclosure** | A database breach (SQL injection, misconfigured storage, insider access) exposes both ciphertext and encryption keys. The attacker can decrypt all stored files. | Complete loss of confidentiality for all user data. |
| **Tampering** | An attacker with database write access can modify encryption keys or encrypted data, causing data corruption or making files unrecoverable. They could also replace keys with their own, then re-encrypt data, effectively taking ownership of the encrypted files. | Data integrity violation; potential ransomware-like extortion. |
| **Elevation of Privilege** | If the same encryption keys are used across multiple systems or services, an attacker who obtains the keys may decrypt data beyond the storage service, gaining access to backup systems or linked cloud resources. | Lateral movement and broader system compromise. |
| **Repudiation** | Without proper key management and logging, it becomes impossible to prove who accessed or modified the keys. Malicious actions can be denied. | Weakened auditability and non-repudiation. |

**Conclusion:** Encryption keys must be stored separately from encrypted data, ideally in a hardware security module (HSM), a key management service (KMS), or a secure enclave. Access to keys should be strictly controlled, audited, and never stored in the same location as the data they protect.

---

## Risk Matrix for Top 5 Threats

**Formula:** Risk Score = Likelihood (1–5) × Impact (1–5)

| Threat | Likelihood (1–5) | Impact (1–5) | Risk Score | Risk Level |
|--------|:----------------:|:------------:|:----------:|------------|
| **Public link leakage exposes files** | 4 | 5 | 20 | **Critical** |
| **SQL injection leads to database breach, exposing keys** | 3 | 5 | 15 | **High** |
| **Stored XSS via malicious file upload** | 3 | 4 | 12 | **High** |
| **IDOR vulnerability in file download endpoint** | 4 | 4 | 16 | **Critical** |
| **Compromised admin account via credential stuffing** | 3 | 5 | 15 | **High** |

**Notes:**
- Likelihood: 1 = Very unlikely, 5 = Almost certain.
- Impact: 1 = Negligible, 5 = Severe/catastrophic.
- Risk levels: 1–5 Low, 6–10 Medium, 12–16 High, 20–25 Critical.

---

**References:**
- OWASP Top 10 Web Application Security Risks
- NIST Special Publication 800-57, "Recommendation for Key Management"
- Cloud Security Alliance (CSA) Top Threats to Cloud Computing
