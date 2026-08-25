# Password Policy

## Document Control

| Field | Value |
|-------|-------|
| Policy ID | POL-PWD-001 |
| Version | 2.0 |
| Effective Date | 2026-08-25 |
| Review Date | 2027-08-25 |
| Policy Owner | Chief Information Security Officer (CISO) |
| Approved By | Chief Information Officer (CIO) |
| Classification | Internal |

---

## 1. Purpose

This policy establishes minimum requirements for the creation, management, storage, and use of passwords and authentication mechanisms at SecureBank Financial Services. The objective is to protect customer data, financial assets, and internal systems from unauthorized access, while aligning with NIST Special Publication 800-63B, PCI-DSS, SOX, and FFIEC guidelines.

---

## 2. Scope

### 2.1 Applicability

This policy applies to:

- [x] All employees
- [x] Contractors and consultants
- [x] Third-party vendors with system access
- [x] Remote workers
- [x] All service and privileged accounts

### 2.2 Systems/Assets Covered

- Core banking system
- Customer portal
- Employee workstations
- Administrative systems
- Development environment
- All other company systems, networks, and applications that require authentication

### 2.3 Exclusions

- Personal devices not used to access company systems (see BYOD policy)
- Legacy systems that cannot technically enforce the requirements, provided compensating controls are documented and approved by the CISO

---

## 3. Policy Statements

### 3.1 Password Requirements

All passwords must meet the following minimum requirements. Length is prioritized over complexity; passphrases are encouraged.

Requirements:

- **Length:** Minimum 12 characters; 16 or more recommended for standard accounts.
- **Privileged accounts:** Minimum 15 characters.
- **Complexity:** Not required to contain multiple character types, but passwords must not be easily guessable.
- **Prohibited passwords:** Must not contain:
  - Username, real name, email address, or employee ID
  - Any dictionary word or common password (e.g., "password", "123456", "qwerty")
  - Passwords known to be breached or publicly exposed
  - Repeated or sequential characters (e.g., "aaaaaa", "abcdef", "111111")
- **Screening:** All new passwords must be checked against a known-breached password list and prohibited patterns before acceptance.
- **No periodic change:** Users are not required to change passwords on a fixed schedule unless there is evidence of compromise (per NIST 800-63B).
- **Password history:** The system may prevent reuse of the last 5 passwords.

### 3.2 Password Management

Procedures for password change, reset, lockout, and session timeouts must be defined and enforced.

Requirements:

- **Self-service reset:** Users must use a secure, identity-verified self-service portal for password resets. Identity verification may include security questions, email/SMS codes, or MFA.
- **IT-assisted reset:** If self-service is unavailable, IT must verify identity using a separate channel (e.g., phone callback) before resetting.
- **Initial password:** Temporary passwords must be unique and set to expire on first login.
- **Account lockout:** Accounts are locked after 5 consecutive failed login attempts within 15 minutes. Lockout duration is at least 15 minutes or until manually reset by IT.
- **Session timeout:** User sessions in web applications must idle-timeout after 15 minutes; privileged sessions after 10 minutes. Workstations must auto-lock after 15 minutes of inactivity.
- **Password sharing:** Sharing of any password is prohibited. Each user must have a unique account.

### 3.3 Multi-Factor Authentication (MFA)

MFA is required for all access where a password alone is insufficient to protect high-risk systems and data.

Requirements:

- **MFA is mandatory for:**
  - All remote access (VPN, VDI, cloud services)
  - All privileged accounts (administrators, root, database admins)
  - Access to core banking system
  - Access to administrative systems
  - Customer portal for sensitive actions (e.g., fund transfer)
  - Any system containing cardholder data (PCI-DSS requirement)
- **Approved MFA methods:** See Technical Standards section.
- **MFA bypass:** Emergency bypass must be approved by CISO and logged; bypass periods must be limited and reviewed.
- **Re-authentication:** MFA must be prompted for high-risk actions (e.g., wire transfer over threshold) even if the user has an active session.

### 3.4 Storage

Passwords must never be stored in plaintext. Strong cryptographic hashing is required.

Requirements:

- **Hashing algorithms:** Only approved algorithms may be used (see Technical Standards).
- **Salt:** A unique, cryptographically random salt must be used for each password hash.
- **Key derivation:** Where possible, use keyed hash functions (HMAC) or memory-hard algorithms (Argon2).
- **Password managers:** Company-approved password managers may be used for storing credentials, but the master password must meet this policy's password requirements and MFA must be enabled on the password manager.
- **Prohibited storage:** Passwords must not be stored in scripts, source code, configuration files, spreadsheets, or sticky notes.
- **Transmission:** Passwords must never be transmitted in plaintext. Always use encrypted channels (TLS).

### 3.5 Privileged Accounts

Privileged accounts (system administrators, database administrators, domain admins, service accounts with elevated rights) require enhanced controls.

Requirements:

- **Separate accounts:** Each privileged user must have a dedicated, named privileged account (no shared admin accounts).
- **MFA:** MFA is mandatory for all privileged access.
- **Length and complexity:** Privileged account passwords must be at least 15 characters and should use a passphrase.
- **Rotation:** Privileged account passwords must be rotated every 90 days, unless a Privileged Access Management (PAM) solution manages them automatically.
- **Session monitoring:** All privileged sessions must be recorded and reviewed periodically.
- **PAM solution:** Use of a PAM solution is required for managing, rotating, and auditing privileged credentials.
- **Emergency access:** Emergency access to privileged accounts must be time-bound, logged, and authorized by management.

---

## 4. Roles and Responsibilities

| Role | Responsibilities |
|------|------------------|
| Executive Management | Approve policy, allocate resources, demonstrate commitment |
| IT Security Team | Implement controls, monitor compliance, report violations |
| IT Support | Manage password resets, enforce technical controls, assist users |
| System Administrators | Implement technical safeguards, manage privileged accounts, ensure PAM compliance |
| Department Managers | Ensure team compliance, report issues, support training |
| All Employees | Comply with policy, report incidents, complete training |
| CISO | Own policy, review annually, approve exceptions |

---

## 5. Compliance

### 5.1 Monitoring

Compliance is monitored through:

- Automated password policy enforcement on systems (where possible)
- Regular audits of account configurations and MFA enrollment
- PAM logs and session recordings
- Review of failed login attempts and lockout events

### 5.2 Reporting

The IT Security Team will provide a quarterly compliance report to the CISO, including:

- Number of accounts not meeting password requirements
- Number of MFA exemptions or bypasses
- Number of policy exceptions and their status
- Results of privileged session audits

### 5.3 Auditing

An independent audit of password controls will be conducted annually, or more frequently if required by regulatory or business changes. Audit results will be documented and reviewed by management.

---

## 6. Enforcement

### 6.1 Violations

Violations of this policy may result in:

- Verbal warning
- Written warning
- Suspension of access privileges
- Disciplinary action up to and including termination
- Legal action where applicable

### 6.2 Reporting Violations

Report suspected violations to: **IT Security Team via security@securebank.com or the incident reporting portal**

---

## 7. Exceptions

### 7.1 Exception Process

Exceptions to this policy require:

1. Written request to the CISO or Policy Owner
2. Business justification
3. Risk assessment
4. Compensating controls (if applicable)
5. Formal approval and documentation

### 7.2 Exception Duration

All exceptions must have a defined end date and be reviewed quarterly. Exceptions may be extended only by re-approval.

---

## 8. Definitions

| Term | Definition |
|------|------------|
| Password | A secret string of characters used to authenticate a user to a system |
| Multi-Factor Authentication (MFA) | An authentication method requiring two or more verification factors |
| Privileged Account | An account with elevated permissions (e.g., administrator, root) |
| Privileged Access Management (PAM) | A solution that manages, rotates, and audits privileged credentials |
| Password Manager | An application that securely stores and manages passwords |
| Salt | A random value added to a password before hashing to prevent identical passwords from producing identical hashes |

---

## 9. Related Documents

- NIST Special Publication 800-63B (Digital Identity Guidelines)
- PCI-DSS Requirement 8
- Sarbanes-Oxley (SOX) Act
- FFIEC Authentication Guidance
- Access Control Policy
- Incident Response Policy
- Remote Access Policy

---

## 10. Revision History

| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 1.0 | 2025-01-15 | CISO | Initial release |
| 2.0 | 2026-08-25 | CISO | Updated to align with NIST 800-63B and add MFA/PAM requirements |

---

## 11. Acknowledgment

By accessing company systems, all users acknowledge they have read, understood, and agree to comply with this policy.

For formal acknowledgment tracking, use the company’s policy acknowledgment system.

---

*End of Policy Document*
