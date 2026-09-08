# Complete Control Matrix

## Part 1: Control Registry (Updated)

| Control ID | Control Name | Category | Function | Asset(s) Protected | Effectiveness | Evidence/Source |
|------------|--------------|----------|----------|---------------------|---------------|-----------------|
| C-001 | Firewall: Web Inbound Rule | Technical | Preventive | web-srv-01, DMZ | Strong | Artifact 1 |
| C-002 | Firewall: VPN Site Rules | Technical | Preventive | Server subnet | Weak | Artifact 1 (ALL services allowed) |
| C-003 | Firewall: Default Deny | Technical | Preventive | All network zones | Strong | Artifact 1 |
| C-004 | SSH Hardening on ehr-srv-01 | Technical | Preventive | ehr-srv-01 | Adequate | Artifact 2 (only one server) |
| C-005 | Password Policy | Administrative | Preventive | All user accounts | Adequate | Artifact 3 (8 chars, 90-day, no MFA) |
| C-006 | Endpoint Antivirus | Technical | Preventive | Windows workstations | Adequate | Artifact 4 (88% current) |
| C-007 | Backup & Recovery | Technical | Corrective | Critical VMs | Weak | Artifact 5 (local NAS only, untested) |
| C-008 | Physical Security Guard | Physical | Deterrent | Central main entrance | Adequate | Artifact 6 (weekday only) |
| C-009 | Camera Surveillance | Physical | Detective | Central/Westside entrances | Weak | Artifact 6 (limited, no server room) |
| C-010 | Security Awareness Training | Administrative | Preventive | All employees | Weak | Artifact 7 (58% at Westside) |
| C-011 | Local Logging | Technical | Detective | Firewall, servers, web logs | Weak | Artifact 8 (no centralization) |
| C-012 | Account Lockout (AD GPO) | Technical | Preventive | User accounts | Adequate | Artifact 3 |
| C-013 | MRI Network Isolation (Designed) | Technical | Compensating | MRI/WS-RAD-01 | Weak | Task 6 (not implemented) |
| C-014 | Westside Firewall Replacement (Proposed) | Technical | Compensating | Westside network | Weak | Task 6 (not implemented) |

---

## Part 2: Updated Control Summary Matrix

| Category | Preventive | Detective | Corrective | Compensating | Deterrent |
|----------|------------|-----------|------------|--------------|-----------|
| **Technical** | C-001, C-003, C-004, C-006, C-012 (avg: Adequate) | C-011 (Weak) | C-007 (Weak) | C-013, C-014 (Weak) | — |
| **Administrative** | C-005, C-010 (avg: Weak-Adequate) | — | — | — | — |
| **Physical** | — | C-009 (Weak) | — | — | C-008 (Adequate) |

---

## Part 3: Control Coverage Map

| Critical Asset | Preventive | Detective | Corrective | Compensating | Coverage Assessment |
|----------------|------------|-----------|------------|--------------|---------------------|
| **EHR System (ehr-srv-01, ehr-db-01)** | C-001 (web only), C-003, C-004 (only ehr-srv-01), C-005, C-012 | C-011 (local logs) | C-007 (backup) | — | **Under-Protected** – no MFA, DB exposed, flat network, no SIEM |
| **Network Core & Perimeter** | C-001, C-003 | C-011 (local firewall logs) | — | C-014 (Westside firewall proposed) | **Under-Protected** – flat network, over-permissive VPN, no egress filtering, no segmentation |
| **Medical IoT Devices** | — | — | — | C-013 (MRI only) | **Unprotected** – no segmentation, no patching, default web interfaces, known CVEs |
| **Data Storage & Backup** | C-005 (access), C-012 (lockout) | C-011 (local logs) | C-007 (backup) | — | **Under-Protected** – backup on same network, no offsite, untested, NAS accessible network-wide |
| **Billing Infrastructure** | C-005, C-012 | C-011 (local logs) | C-007 (backup) | — | **Under-Protected** – no MFA, MySQL exposed, outdated OS, no egress filtering |
