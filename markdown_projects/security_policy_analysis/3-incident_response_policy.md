# Incident Response Policy

## Document Control

| Field | Value |
|-------|-------|
| Policy ID | POL-IR-001 |
| Version | 1.0 |
| Effective Date | 2026-08-25 |
| Review Date | 2027-08-25 |
| Policy Owner | Chief Information Security Officer (CISO) |
| Approved By | Chief Executive Officer (CEO) |
| Classification | Internal |

---

## 1. Purpose

This policy defines the framework for detecting, responding to, containing, eradicating, and recovering from security incidents at GlobalTech Manufacturing. The objective is to minimize damage, reduce recovery time and cost, preserve evidence, and comply with ISO 27001, GDPR, and industry-specific regulations.

---

## 2. Scope

### 2.1 Applicability

This policy applies to:

- [x] All employees
- [x] Contractors and consultants
- [x] Third-party vendors with system access
- [x] All IT/OT systems and networks
- [x] All company locations and remote workers

### 2.2 Systems/Assets Covered

- Corporate IT networks and servers
- Manufacturing OT (Operational Technology) systems, including IoT devices
- Cloud environments and SaaS services
- End-user devices (workstations, laptops, mobile devices)
- Databases and applications
- Third-party connections

### 2.3 Exclusions

- Non-company personal devices (unless they contain company data)
- Systems owned and managed by external vendors that are not under direct company control (covered under vendor agreements)

---

## 3. Policy Statements

### 3.1 NIST Incident Response Lifecycle

GlobalTech Manufacturing adopts the NIST Incident Response Lifecycle:

*Preparation → Detection & Analysis → Containment, Eradication & Recovery → Post-Incident Activity*

All incident handling activities must follow this lifecycle. Each phase is described in Section 5 and 6.

### 3.2 Severity Classification

See Incident Classification Matrix below (Section 3.3).

### 3.3 Incident Classification Matrix

| Severity | Description | Response Time | Examples |
|----------|-------------|---------------|----------|
| **Critical** | Incident causes significant system outage, data breach of sensitive information, active threat in OT systems, or major regulatory breach. | Immediate; Response Team activated within 15 minutes. | Ransomware affecting production line; unauthorised access to core network; exfiltration of customer data. |
| **High** | Incident causes major disruption to business operations, or potential data loss, but limited in scope. | Response within 1 hour; contain within 4 hours. | Malware outbreak on multiple workstations; phishing campaign with multiple credential submissions; OT system compromise without production impact. |
| **Medium** | Incident has limited operational impact, or involves suspicious activity requiring investigation. | Response within 4 hours; contain within 24 hours. | Single workstation malware infection; suspicious login attempts; policy violation involving data. |
| **Low** | Minor security event, no operational impact, routine handling. | Response within 1 business day. | Individual spam email reported; failed login attempts; unauthorised software installation. |

---

## 4. Incident Response Team

| Role | Responsibilities |
|------|------------------|
| **Incident Response Manager (IRM)** | Leads all incident response activities; coordinates team; communicates with executives; approves containment actions; ensures documentation. |
| **Security Analysts** | Detect, analyse, and investigate incidents; perform forensics; recommend containment; document technical findings. |
| **IT Support** | Provide access and system knowledge; assist with containment and recovery; implement patches and configurations. |
| **Legal Counsel** | Advise on regulatory obligations (GDPR, notification requirements); review evidence handling; guide external communications. |
| **Communications/PR** | Prepare and deliver internal/external communications; manage public statements; prevent reputational damage. |
| **Executive Sponsor** | Provides authority for critical decisions; approves major containment actions; communicates with board. |

---

## 5. Detection and Reporting

### 5.1 How Incidents Are Detected

Incidents can be detected through:

- Security monitoring tools (SIEM, IDS/IPS, antivirus)
- User reports (helpdesk, email, phone)
- Automated alerts from firewalls, endpoint protection, or OT monitoring systems
- External notifications (law enforcement, vendors, third parties)
- Audit log review
- Physical security systems

### 5.2 How to Report an Incident

Employees must report any suspected security incident immediately to:

- **IT Helpdesk:** it-support(@)globaltech.com
- **Security Team:** soc(@)globaltech.com
- **Phone:** +1-XXX-XXX-XXXX (24/7)

All reports must be acknowledged and logged by the Incident Response Team.

### 5.3 What Information to Collect

When reporting an incident, provide as much detail as possible:

- Date and time of occurrence
- Description of the event
- Affected systems or data
- User accounts involved
- Error messages or suspicious activity
- Any actions already taken
- Contact information of the reporter

### 5.4 Initial Assessment

The Incident Response Manager, or a designated Security Analyst, performs an initial assessment to:

1. Verify the incident is valid (not a false positive).
2. Determine the severity using the classification matrix.
3. Notify appropriate team members.
4. Begin documentation and evidence preservation.

---

## 6. Response Procedures

### 6.1 Containment

**Short-Term Containment (immediate):**

- Isolate affected systems from the network (unplug cable, disable switch port).
- Disable compromised user accounts or change passwords.
- Block malicious IPs or domains.
- Preserve volatile evidence (memory dumps, running processes, network connections).

**Long-Term Containment (temporary fix):**

- Apply patches or configuration changes to prevent reinfection.
- Rebuild systems from known-good images if necessary.
- Implement additional access controls until root cause is found.

**Evidence Preservation:**

- Make forensic copies of affected systems (disk images).
- Preserve logs, network captures, and memory images.
- Document all containment actions with timestamps.

### 6.2 Eradication

- Identify root cause of the incident.
- Remove malware, backdoors, or malicious code.
- Fix vulnerabilities that were exploited.
- Validate that the threat is completely removed from all affected systems.

### 6.3 Recovery

- Restore systems from clean backups or rebuild from scratch.
- Test systems to ensure they are fully functional and secure.
- Monitor systems closely for any signs of re-infection or residual threat.
- Obtain approval from IRM before returning systems to production.

---

## 7. Communication Plan

| Stakeholder | When to Notify | Method |
|-------------|----------------|--------|
| Executive Management | Critical and High severity incidents within 1 hour; Medium within 24 hours | Phone call + summary email |
| Legal | Any incident involving personal data or potential regulatory breach (immediately for Critical/High) | Direct meeting or secure email |
| Regulators | GDPR: within 72 hours of a confirmed personal data breach | Official notification via legal counsel |
| Affected Users | After containment and when it is safe to disclose; for credential compromise, immediately upon detection | Company email, internal portal, or direct communication |

---

## 8. Evidence Handling

### 8.1 Chain of Custody

- All evidence must be labelled with a unique ID.
- A chain of custody log must record every person who handles evidence, the date/time, and the reason.
- Evidence must be stored in a secure, access-controlled location.

### 8.2 Evidence Preservation

- Use write-blockers when creating disk images.
- Create hash values (MD5/SHA-256) for all evidence files.
- Preserve volatile data before powering down systems.

### 8.3 Documentation Requirements

- Maintain a detailed incident log, including:
  - Timeline of events
  - Actions taken
  - Personnel involved
  - Evidence collected
  - Decisions made

---

## 9. Post-Incident Activities

### 9.1 Lessons Learned

Within two weeks of incident closure, the Incident Response Team must hold a lessons learned meeting to:

- Review the incident and response effectiveness.
- Identify areas for improvement in processes, tools, or training.
- Update playbooks and policies accordingly.

### 9.2 Report Requirements

A written incident report must be produced and distributed to executive management. The report includes:

- Summary of the incident
- Root cause analysis
- Timeline of response actions
- Impact assessment
- Recommendations for improvement

---

## 10. Enforcement

Violations of this policy may result in disciplinary action, up to and including termination. Failure to report an incident or interfering with an investigation is a serious policy violation.

---

## 11. Exceptions

Exceptions to this policy must be approved by the CISO and documented. All exceptions are reviewed quarterly.

---

## 12. Definitions

| Term | Definition |
|------|------------|
| Incident | A security event that compromises the confidentiality, integrity, or availability of an information asset or violates a security policy. |
| OT (Operational Technology) | Hardware and software that detects or causes changes through direct monitoring and control of physical devices. |
| IOC (Indicator of Compromise) | Forensic evidence of a potential intrusion. |
| Containment | Actions taken to limit the scope and impact of an incident. |
| Eradication | Removal of the threat from the environment. |

---

## 13. Related Documents

- ISO 27001 Information Security Management System
- GDPR Regulation (EU) 2016/679
- NIST Special Publication 800-61 (Computer Security Incident Handling Guide)
- Business Continuity Plan
- Disaster Recovery Plan
- Acceptable Use Policy

---

## 14. Revision History

| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 1.0 | 2026-08-25 | CISO | Initial release |

---

## 15. Acknowledgment

By accessing company systems, all users acknowledge they have read, understood, and agree to comply with this policy.

---

*End of Policy Document*

---

# Incident Report Template

## Incident Summary

| Field | Value |
|-------|-------|
| Incident ID | IR-XXXX |
| Severity | Critical / High / Medium / Low |
| Date/Time Reported | YYYY-MM-DD HH:MM |
| Reported By | Name / Department |
| Date/Time Detected | YYYY-MM-DD HH:MM |
| Date/Time Resolved | YYYY-MM-DD HH:MM |
| Incident Owner | Name |

## Description

[Provide a detailed narrative of the incident.]

## Timeline

| Time | Action | Responsible Person |
|------|--------|-------------------|
| | | |

## Affected Systems / Data

[List affected systems and data, and the type of data exposed.]

## Root Cause

[Describe the root cause of the incident.]

## Impact Assessment

[Describe impact on confidentiality, integrity, availability, regulatory compliance, and business operations.]

## Containment / Eradication / Recovery Actions

[Detail all actions taken.]

## Evidence Collected

[List evidence and chain of custody details.]

## Lessons Learned

[What went well, what could be improved.]

## Recommendations

[Specific, actionable recommendations to prevent recurrence.]

