# Risk Treatment Decisions

## GAP-001: Flat network with no segmentation

**Risk Level:** Critical

**Treatment Strategy:** Mitigate

**Justification:** Segmentation is fundamental; without it, every other control is weakened. Cost is moderate relative to impact of a network-wide compromise.

**Proposed Controls:**
- VLAN segmentation: clinical, medical devices, servers, management
- Internal firewall rules between zones
- Network access control (NAC) for endpoint admission

**Estimated Cost:** $50K+ (switch/firewall config and possible new hardware)

**Implementation Effort:** Long-term (> 1 month)

**Expected Risk Reduction:** High – prevents lateral movement and limits ransomware/device compromise blast radius.

**Trade-offs:** Requires downtime for re-addressing; clinical workflows may be disrupted during migration.

---

## GAP-002: Westside consumer router and no firewall

**Risk Level:** Critical

**Treatment Strategy:** Mitigate

**Justification:** A consumer router at a medical facility with VPN access to the server subnet is an unacceptable single point of failure.

**Proposed Controls:**
- Deploy enterprise firewall at Westside (e.g., FortiGate 40F)
- Restrict VPN rules to specific ports, not ALL services
- Enable logging and central management

**Estimated Cost:** $1–10K

**Implementation Effort:** Short-term (< 1 month)

**Expected Risk Reduction:** High – eliminates easy pivot from clinic to Central servers.

**Trade-offs:** Requires configuration and testing; Westside staff may experience brief VPN interruption.

---

## GAP-005: Backups stored locally without offsite copy

**Risk Level:** Critical

**Treatment Strategy:** Mitigate

**Justification:** Offsite backup is the only corrective control that can recover from ransomware or physical disaster.

**Proposed Controls:**
- Cloud backup replication (e.g., AWS S3) for critical VMs
- At minimum, offsite NAS or tape rotation
- Regular restore testing

**Estimated Cost:** $10–50K (cloud storage + bandwidth)

**Implementation Effort:** Short-term (< 1 month)

**Expected Risk Reduction:** High – ensures recovery even if primary and local backups are destroyed.

**Trade-offs:** Ongoing monthly cost; initial data transfer may be slow.

---

## GAP-008: Medical IoT devices exposed and vulnerable

**Risk Level:** Critical

**Treatment Strategy:** Mitigate (with segmentation as immediate control)

**Justification:** Direct patient safety risk from compromised pumps/monitors; segmentation is the only feasible short-term mitigation.

**Proposed Controls:**
- Isolate medical devices in dedicated VLAN with strict ACLs
- Disable unnecessary services (HTTP/HTTPS) where possible
- Work with vendors to apply firmware updates

**Estimated Cost:** $10–50K (part of segmentation project)

**Implementation Effort:** Long-term (> 1 month)

**Expected Risk Reduction:** High – reduces attack surface to medical devices and contains compromise.

**Trade-offs:** May require vendor involvement; some devices may be difficult to move without affecting clinical workflow.

---

## GAP-003: No Multi-Factor Authentication

**Risk Level:** High

**Treatment Strategy:** Mitigate

**Justification:** MFA is a high-value, low-cost control that significantly reduces account takeover risk.

**Proposed Controls:**
- Deploy MFA for all remote access (VPN, O365)
- Require MFA for privileged accounts (domain admins, server admins)
- Use TOTP or push notifications via existing Microsoft O365 licensing

**Estimated Cost:** $0–1K (using existing O365 capabilities)

**Implementation Effort:** Quick Win (< 1 week)

**Expected Risk Reduction:** High – blocks credential-based attacks even if passwords are compromised.

**Trade-offs:** User friction; need to enroll all users and provide backup methods.

---

## GAP-004: Shared radiology account

**Risk Level:** High

**Treatment Strategy:** Mitigate

**Justification:** Shared accounts prevent accountability and violate HIPAA; individual accounts are feasible with minimal cost.

**Proposed Controls:**
- Create individual AD accounts for radiology staff
- Enforce role-based access to PACS
- Enable auditing on PACS logins

**Estimated Cost:** $0–1K

**Implementation Effort:** Quick Win (< 1 week)

**Expected Risk Reduction:** High – restores accountability and traceability; reduces unauthorized access.

**Trade-offs:** Radiology staff must remember new credentials; minor workflow adjustment.

---

## GAP-006: No centralized logging or alerting

**Risk Level:** High

**Treatment Strategy:** Mitigate (phased)

**Justification:** Centralized logging is essential for detection and forensics, but full SIEM may exceed budget. Start with open-source or cloud-based log aggregation.

**Proposed Controls:**
- Deploy Wazuh (open-source) or similar log collector
- Forward logs from critical servers, firewall, AD
- Configure basic alerting for suspicious events

**Estimated Cost:** $0–10K (hardware/VM, labor)

**Implementation Effort:** Long-term (> 1 month)

**Expected Risk Reduction:** Medium – provides detective capability and evidence; reduces time to detect.

**Trade-offs:** Requires ongoing tuning; initial setup effort.

---

## Budget Summary

| Gap | Treatment | Estimated Cost |
|-----|-----------|----------------|
| GAP-001 Segmentation | Mitigate | $50K+ |
| GAP-002 Westside firewall | Mitigate | $1–10K |
| GAP-005 Offsite backup | Mitigate | $10–50K |
| GAP-008 Medical IoT isolation | Mitigate | (included in GAP-001) |
| GAP-003 MFA | Mitigate | $0–1K |
| GAP-004 Shared account | Mitigate | $0–1K |
| GAP-006 Logging | Mitigate | $0–10K |
| **Total** | | **$61K–121K** |

If costs approach the upper end, defer full segmentation (GAP-001) to next fiscal year, implementing a subset (e.g., server VLAN only) now. Offsite backup and Westside firewall are non-negotiable quick wins. MFA and shared account remediation are essentially no-cost and should be done immediately.

