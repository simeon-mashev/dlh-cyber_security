# MedDefense Health Systems – Security Posture Assessment

**Prepared for:** Board of Directors  
**Prepared by:** Security Analyst (Simeon Mashev), Deputy CISO James Chen  
**Date:** [Current Date]

---

## 1. Executive Summary

MedDefense Health Systems operates with a fundamentally weak security posture. The organization has no dedicated security function, no network segmentation, and critical patient data is exposed across flat networks with legacy systems. The single most critical finding is that **a compromise of any single system could spread laterally to patient monitors, EHR databases, and backup repositories, potentially causing both a data breach and patient safety incident.**

**Top 3 Recommended Actions:**

1. **Segment the network immediately** – isolate clinical, IoT, and server zones to contain threats.
2. **Deploy multi-factor authentication (MFA)** for all remote access and privileged accounts using existing Microsoft licensing.
3. **Implement offsite backups** – current backups reside in the same server room and would be destroyed by ransomware or physical disaster.

**Budget implication:** The requested security budget increase is essential; the top mitigations can begin with the current $120,000 allocation, but long-term segmentation will require additional funding next fiscal year.

---

## 2. Scope and Methodology

**Assessed:** Three sites (Central Hospital, Westside Clinic, Corporate HQ), all IT assets, medical IoT, network, physical security, and data handling processes.

**Sources:** Onboarding documentation, IT asset list, Marcus Webb’s notes, network scan, control artifacts, walk-through observations, incident logs.

**Limitations:** Asset inventory incomplete; endpoint counts from 8-month-old AD reports; some devices unverified or offline during scan. No direct access to cloud configurations.

---

## 3. Asset Landscape

**Total assets identified:** approximately 600 endpoints, 11 servers, 12 network devices, 80+ medical IoT devices, and two undocumented shadow IT devices.

**Top 5 Critical Assets:**

| Asset | Justification |
|-------|---------------|
| EHR System (ehr-srv-01, ehr-db-01) | Contains complete patient records; any breach causes HIPAA violations and clinical disruption. |
| Network Core & Perimeter | Flat network and over-permissive firewall allow lateral movement to all other systems. |
| Medical IoT Devices | Infusion pumps and monitors directly affect patient safety; known firmware vulnerabilities. |
| Data Storage & Backup | Local NAS holds only recovery copies; loss destroys all backups. |
| Billing Infrastructure | Revenue dependency and exposure of financial/PHI data. |

**Data classification:** PHI (Restricted), PII (Confidential), financial (Confidential), internal operations (Internal), public materials (Public).

---

## 4. Current Security Controls

**Control inventory:** 12 controls identified across technical, administrative, and physical categories.

| Category | Preventive | Detective | Corrective | Compensating | Deterrent |
|----------|------------|-----------|------------|--------------|-----------|
| Technical | 6 (Adequate) | 1 (Weak) | 1 (Weak) | 2 (Weak) | — |
| Administrative | 2 (Weak) | — | — | — | — |
| Physical | — | 1 (Weak) | — | — | 1 (Adequate) |

**Maturity:** Weak overall. Strongest controls are the firewall default deny and SSH hardening on one server. Weaknesses are pervasive: no MFA, no centralized logging, poor physical security, and no segmentation.

---

## 5. Gap Analysis

**Critical Gaps:**

| Gap | Description | Affected Assets | Potential Impact | Recommended Treatment |
|-----|-------------|-----------------|------------------|----------------------|
| GAP-001 | Flat network, no segmentation | All critical assets | Lateral movement, ransomware | Mitigate – VLAN segmentation |
| GAP-002 | Westside consumer router/no firewall | Westside, Central servers via VPN | Pivot to server subnet | Mitigate – enterprise firewall |
| GAP-005 | Backups local only | backup-srv-01, NAS-01 | Total data loss | Mitigate – offsite backup |
| GAP-008 | Medical IoT exposed, vulnerable | Pumps, monitors | Patient harm | Mitigate – isolation + patching |

**High Gaps:**

| Gap | Description | Affected Assets | Potential Impact | Recommended Treatment |
|-----|-------------|-----------------|------------------|----------------------|
| GAP-003 | No MFA | All accounts | Account takeover | Mitigate – deploy MFA |
| GAP-004 | Shared radiology account | PACS | Unauthorized access | Mitigate – individual accounts |
| GAP-006 | No centralized logging | All systems | Undetected breaches | Mitigate – open-source SIEM |
| GAP-009 | Weak physical security | Server room, Westside closet | Physical access | Mitigate – access control, cameras |
| GAP-010 | No IR/BCP/DR plans | All | Slow recovery | Mitigate – create plans |
| GAP-011 | Endpoint protection gaps | Servers, Linux, iPads | Malware spread | Mitigate – expand coverage |
| GAP-012 | Shadow IT devices | Central server subnet | Unknown | Mitigate – remove/inventory |

**Concentration:** Most gaps are technical preventive (segmentation, MFA, access control) and technical detective (logging, monitoring).

---

## 6. Risk Treatment Recommendations

**Priority recommendations (fit within $120K):**

| Gap | Treatment | Cost | Timeline |
|-----|-----------|------|----------|
| GAP-002 | Deploy Westside firewall | $5K | < 1 month |
| GAP-005 | Offsite cloud backup | $20K | < 1 month |
| GAP-003 | Enable MFA (O365) | $0 | < 1 week |
| GAP-004 | Remove shared account | $0 | < 1 week |
| GAP-006 | Deploy open-source SIEM (Wazuh) | $5K (VM) | 1–3 months |
| GAP-009 | Server room locks/cameras | $10K | < 1 month |
| GAP-001 (partial) | Implement server VLAN only | $30K | 3–6 months |

**Total:** ~$70K, leaving $50K for contingency. Full network segmentation and medical IoT isolation deferred to next fiscal year (~$50K+).

**Quick wins (< 1 week):**
- Enable MFA for remote/admin accounts.
- Create individual radiology accounts.
- Disable the “do not log out” sign and enforce screen lockouts.

**Short-term (< 1 month):**
- Replace Westside router with FortiGate.
- Set up offsite backup.
- Install cameras and lock server room.

**Long-term (> 1 month):**
- Full VLAN segmentation.
- Centralized logging with alerting.
- Incident response and disaster recovery plans.

---

## 7. Conclusion and Next Steps

MedDefense’s security posture is **not adequate** for a healthcare organization handling protected health information. Without rapid action, a successful attack would likely result in significant financial loss, regulatory penalties, and threats to patient safety.

If these recommendations are not funded, the organization accepts a high probability of a major security incident within the next 12 months. The current $120,000 can initiate the most urgent controls, but sustained investment is required for full remediation.

**Next phase:** Conduct an External Threat Landscape Assessment, building on Marcus Webb’s unfinished research on healthcare-targeted attacks. This will identify specific threat actors and tactics most likely to target MedDefense, further refining our mitigation priorities.
