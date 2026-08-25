# Data Classification Policy

## Document Control

| Field | Value |
|-------|-------|
| Policy ID | POL-DC-001 |
| Version | 1.0 |
| Effective Date | 2026-08-25 |
| Review Date | 2027-08-25 |
| Policy Owner | Chief Information Security Officer (CISO) |
| Approved By | Chief Executive Officer (CEO) |
| Classification | Internal |

---

## 1. Purpose

This policy defines how HealthPlus Medical Group classifies data according to its sensitivity and establishes the minimum handling, storage, transmission, access control, and disposal requirements for each classification level. The objective is to protect patient privacy, comply with HIPAA, GDPR, and applicable state privacy laws, and reduce the risk of data breaches.

---

## 2. Scope

### 2.1 Applicability

This policy applies to:

- [x] All employees
- [x] Contractors and consultants
- [x] Third-party vendors with data access
- [x] All company systems, networks, and devices

### 2.2 Systems/Assets Covered

- All electronic data stored, processed, or transmitted by HealthPlus Medical Group
- All physical records (paper files, film, removable media)
- All information systems, including cloud services, databases, email, and collaboration tools

### 2.3 Exclusions

- Personal data of employees not related to their employment (covered under HR privacy policy)
- Publicly available information not owned by HealthPlus Medical Group

---

## 3. Classification Levels

| Level | Description | Examples |
|-------|-------------|----------|
| **PUBLIC** | Information approved for release to the general public. No harm if disclosed. | Marketing materials, public website content, press releases, published research summaries. |
| **INTERNAL** | Information intended for internal use only. Disclosure could cause minor inconvenience or embarrassment. | Internal memos, organizational charts, staff directories, non-sensitive policies. |
| **CONFIDENTIAL** | Information that could cause harm to individuals, the organization, or partners if disclosed. | Employee PII (social security numbers, salaries), financial data, contracts, business plans. |
| **RESTRICTED** | Information that could cause severe damage, legal penalties, or significant harm to patients if disclosed. | Patient medical records (PHI), authentication credentials, encryption keys, sensitive research data. |

---

## 4. Handling Requirements by Classification

The following table defines minimum handling requirements for each classification level.

| Requirement | PUBLIC | INTERNAL | CONFIDENTIAL | RESTRICTED |
|-------------|:------:|:--------:|:------------:|:----------:|
| **Labeling** | No | Yes | Yes | Yes |
| **Encryption at Rest** | No | Optional | Yes | Yes |
| **Encryption in Transit** | Optional | Yes | Yes | Yes |
| **Access Control** | Public access | All employees | Role-based; authorized personnel only | Strict role-based; least privilege; need-to-know |
| **Copying/Printing** | Allowed | Allowed | Controlled; must be logged | Prohibited or strictly controlled with approval |
| **Storage Location** | Public website / shared drives | Internal file servers / approved cloud | Encrypted internal systems / approved cloud | Encrypted internal systems / approved cloud with additional controls |
| **Email** | Allowed | Allowed with care | Encrypted email or secure file transfer | Encrypted email or secure file transfer only |
| **Disposal** | Delete / recycle | Shred or digital erase | Cross-cut shred / cryptographic erase | Cross-cut shred / degauss / cryptographic erase with certificate of destruction |

---

## 5. Policy Statements

### 5.1 Labeling

All data classified above PUBLIC must be clearly labeled according to its classification level.

Requirements:

- **Electronic files**: Include classification in file name or document header (e.g., `CONFIDENTIAL_Employee_Salaries.xlsx`).
- **Emails**: Include classification tag in subject line when sending INTERNAL, CONFIDENTIAL, or RESTRICTED information (e.g., `[CONFIDENTIAL] Contract details`).
- **Physical documents**: Use cover sheets or colored folders that indicate classification.
- **Removable media**: Label the media itself with the classification level.
- Users must not remove or alter classification labels without authorization.

### 5.2 Storage

Data must be stored only in locations appropriate for its classification level.

Requirements:

- **PUBLIC**: May be stored on public websites, shared drives, or any location without restriction.
- **INTERNAL**: Store on internal file servers, intranet, or company-approved cloud services. Do not store on personal devices or public cloud without approval.
- **CONFIDENTIAL**: Store on encrypted internal systems, company-approved encrypted cloud services, or secure departmental folders. Never on personal devices or unencrypted external drives.
- **RESTRICTED**: Store only on approved encrypted systems with strict access controls. No personal devices. No external drives unless encrypted and approved by IT Security.

Prohibited storage locations for CONFIDENTIAL and RESTRICTED data:
- Personal cloud accounts (e.g., personal Google Drive, Dropbox)
- Unencrypted USB drives
- Personal laptops or phones
- Public file-sharing services

### 5.3 Transmission

Data in transit must be protected according to its classification.

Requirements:

- **PUBLIC**: No special requirements. May be sent via any standard method.
- **INTERNAL**: Use company email or approved collaboration tools. Do not send to personal email accounts.
- **CONFIDENTIAL**: Use encrypted email (e.g., TLS enforced) or approved secure file transfer services. Do not send via standard unencrypted email.
- **RESTRICTED**: Only via approved secure file transfer mechanisms (e.g., SFTP, encrypted portal, secure API). Email is prohibited unless explicitly encrypted with approved technology.

Employees must verify the recipient and use appropriate methods before transmitting CONFIDENTIAL or RESTRICTED data.

### 5.4 Disposal

Data must be securely destroyed when no longer needed.

Requirements:

- **PUBLIC**: Normal deletion or recycling is acceptable.
- **INTERNAL**: Shred paper documents; delete electronic files and empty recycle bin.
- **CONFIDENTIAL**: Cross-cut shred paper; use cryptographic erase or data-wipe tools for electronic files. Maintain disposal log.
- **RESTRICTED**: Cross-cut shred paper with witness; use degaussing, cryptographic erase, or physical destruction for media. Maintain certificate of destruction or disposal log.

Never dispose of CONFIDENTIAL or RESTRICTED materials in regular trash or recycling bins.

### 5.5 Access Control

Access must be based on the principle of least privilege and need-to-know.

Requirements:

- **PUBLIC**: Open to everyone; no access restrictions.
- **INTERNAL**: Access granted to all employees and authorized contractors. Managed via normal Active Directory group membership.
- **CONFIDENTIAL**: Access restricted to specific roles or departments. Access must be approved by data owner or manager. Access reviews quarterly.
- **RESTRICTED**: Access restricted to named individuals with a documented business need. Dual approval required (data owner + security officer). Access reviews monthly. All access logged and monitored.

Privileged users (IT administrators) must not access RESTRICTED data unless necessary and must have their access reviewed continuously.

---

## 6. Data Ownership and Responsibilities

| Role | Responsibilities |
|------|------------------|
| Data Owner | Classifies data, approves access, reviews classification annually |
| Data Custodian | Implements technical controls (encryption, backup, access), follows storage and disposal procedures |
| IT Security Team | Enforces access controls, monitors for violations, supports data classification |
| All Employees | Follow classification and handling requirements, report mishandling |
| CISO | Owns policy, resolves disputes, approves exceptions |

---

## 7. Compliance

### 7.1 Monitoring

Compliance is monitored through:

- Periodic access reviews for CONFIDENTIAL and RESTRICTED data
- Automated data loss prevention (DLP) tools where available
- Spot checks of storage locations and email transmissions
- Review of disposal logs

### 7.2 Reporting

The IT Security Team will provide a quarterly compliance report to the CISO, including:

- Number of access reviews completed
- Number of policy violations detected
- Results of DLP alerts
- Disposal log review findings

### 7.3 Auditing

An independent audit of data classification and handling will be conducted annually, or more frequently if required by regulatory or business changes.

---

## 8. Enforcement

Violations of this policy may result in disciplinary action, up to and including termination. Mishandling of RESTRICTED or CONFIDENTIAL data may also result in legal action.

---

## 9. Exceptions

Exceptions to this policy require written approval from the CISO, with justification, risk assessment, and compensating controls. All exceptions are reviewed quarterly.

---

## 10. Definitions

| Term | Definition |
|------|------------|
| PHI | Protected Health Information – individually identifiable health information |
| PII | Personally Identifiable Information – data that can identify an individual |
| Encryption at Rest | Encryption applied to data stored on disk or media |
| Encryption in Transit | Encryption applied to data while it is being transmitted over a network |
| Data Owner | Person with authority over a specific data set and responsibility for its classification and access |
| Need-to-Know | Principle that access is granted only if required to perform job duties |

---

## 11. Related Documents

- HIPAA Security Rule
- GDPR Regulation (EU) 2016/679
- Access Control Policy
- Incident Response Policy
- Acceptable Use Policy
- Data Retention and Disposal Standard

---

## 12. Revision History

| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 1.0 | 2026-08-25 | CISO | Initial release |

---

## 13. Acknowledgment

By accessing company systems, all users acknowledge they have read, understood, and agree to comply with this policy.

---

*End of Policy Document*
