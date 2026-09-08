# Prioritized Gap Analysis

| Gap ID | Title | Affected Asset(s) | Data at Risk | Current Control Status | What is Missing | Risk Level | Risk Justification | Potential Impact |
|--------|-------|-------------------|--------------|------------------------|-----------------|------------|-------------------|------------------|
| GAP-001 | Flat network with no segmentation | Network Core, EHR, Medical IoT, all servers | PHI, PII, financial | Firewall C-001/C-003 only; no VLANs | Network segmentation, egress filtering, internal firewalls | Critical | Critical assets share broadcast domain; compromise anywhere reaches everywhere; no detective/corrective to stop lateral movement | Ransomware spreads to all systems; medical device takeover; full PHI breach |
| GAP-002 | Westside consumer router and no firewall | Westside network, VPN to Central | PHI, PII | None beyond Netgear built-in NAT; VPN rule C-002 allows ALL services | Managed firewall, IPSec tunnel hardening, traffic monitoring | Critical | Untrusted site with weak router gets VPN full access to Central server subnet | Attacker compromises router, pivots to EHR, billing, domain controllers |
| GAP-003 | No Multi-Factor Authentication | All user accounts, remote access, admin | PHI, PII, credentials | Password policy C-005 (8 chars, 90-day) only | MFA for remote access, privileged accounts, cloud services | High | Credential theft via phishing/cracking gives full access; no secondary authentication layer | Account takeover, EHR exposure, financial fraud, HIPAA violation |
| GAP-004 | Shared radiology account | pacs-srv-01, PACS workstations | PHI (imaging) | Password policy discourages but allows shared accounts | Unique accounts, role-based access control, audit of access | High | Shared login `raduser` cannot be traced to individuals; enables unauthorized access and repudiation | PHI leakage; no accountability; regulatory non-compliance |
| GAP-005 | Backups stored locally without offsite copy | backup-srv-01, NAS-01, all critical VMs | PHI, billing, AD, files | Veeam backup C-007 (daily to local NAS) | Offsite/cloud backup, air-gapped copy, tested restore | Critical | Ransomware or physical disaster destroys both primary and backup; no corrective control available | Permanent data loss; weeks of downtime; regulatory penalties; patient harm |
| GAP-006 | No centralized logging or alerting | All servers, firewall, applications | Audit trails, security events | Local logs C-011 only; no SIEM; no alerting | Central SIEM, log correlation, real-time alerts | High | Incidents undetected until user reports; no forensic evidence; no detective control at scale | Prolonged breaches, missed attacks, failed compliance, delayed response |
| GAP-007 | Unsupported/outdated systems | billing-srv-01 (Ubuntu 18.04), print-srv-01 (2012 R2), WS-RAD-01 (XP), MRI | PHI, billing, operational | Some Sophos coverage C-006 on workstations only | OS upgrades or extended support, compensating controls for EOL | High | Known vulnerabilities exist; no patching; billing server already compromised by cryptominer | Exploitation leading to data breach, service outage, malware |
| GAP-008 | Medical IoT devices exposed and vulnerable | Infusion pumps, patient monitors, nurse call, badge | PHI, patient safety data | None; flat network, known CVEs, web interfaces open | Network isolation, vendor patching, access controls, monitoring | Critical | Directly controls patient medication/monitoring; no detective or corrective; known firmware CVEs | Attackers alter dosages, disable monitoring, cause patient harm |
| GAP-009 | Weak physical security for infrastructure | Server room, Westside server closet, network closets | All data, infrastructure | Guard C-008 (weekday entrance only), cameras C-009 (limited) | Server room access control, cameras, visitor logs, locking cabinets | High | Generic badge opens server room; no cameras/logs; Westside closet unlocked | Unauthorized physical access, device tampering, data theft, service disruption |
| GAP-010 | No incident response/BCP/DR plans | All critical assets | All data | None; ad-hoc incident handling | Formal IR plan, BCP, DR, tested rollback procedures | High | No documented containment/eradication/recovery; regulatory requirement unmet | Slow recovery, increased damage, compliance fines, patient safety risk |
| GAP-011 | Endpoint protection gaps | Servers, Linux systems, iPads, mobile | System integrity | Sophos C-006 only on 372 Windows workstations; 88% current | Server endpoint protection, Linux support, mobile device management | Medium | Servers/Linux/iPads unprotected; 12% workstations outdated | Malware spreads, ransomware execution, data exfiltration |
| GAP-012 | Undocumented/Shadow IT devices | Central server subnet, Westside network | Unknown (potential PHI) | None; identified in scan | Asset discovery, removal/inventory, network access control | Medium | Unknown Linux devices with web services; no ownership or security | Backdoors, data leakage, unmanaged services on critical subnets |

---

## Gap Distribution Summary

| Risk Level | Number of Gaps |
|------------|:--------------:|
| Critical | 5 |
| High | 6 |
| Medium | 1 |
| Low | 0 |

**Asset categories with most gaps:**
- Servers (Central & Westside) – 7 gaps
- Network Infrastructure – 4 gaps
- Medical IoT – 2 gaps
- Physical Infrastructure – 1 gap
- Endpoints – 1 gap

**Control category/function concentration:**
- Gaps are concentrated in **Technical Preventive** controls (missing segmentation, MFA, access control, patching).
- **Technical Detective** controls are almost entirely absent (no SIEM/central logging).
- **Technical Corrective** controls are present but inadequate (backup only).
- **Administrative** controls are weak (training, IR, policies not enforced).
- **Physical** controls are inadequate for critical areas.
