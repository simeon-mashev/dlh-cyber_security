# Control Inventory

| Control ID | Control Name | Description | Category | Function | Asset(s) Protected | Source |
|------------|--------------|-------------|----------|----------|---------------------|--------|
| C-001 | Firewall: Web Inbound Rule | FortiGate allows HTTP/HTTPS from WAN to web-srv-01 in DMZ only; all other inbound denied by Deny-All rule | Technical | Preventive | web-srv-01, DMZ | Artifact 1 |
| C-002 | Firewall: VPN Site Rules | FortiGate allows VPN traffic from Westside and HQ subnets to server subnet (ALL services) | Technical | Preventive | Server subnet | Artifact 1 |
| C-003 | Firewall: Default Deny | FortiGate explicit Deny-All rule drops any traffic not matching preceding rules | Technical | Preventive | All network zones | Artifact 1 |
| C-004 | SSH Hardening on ehr-srv-01 | sshd_config enforces key-only authentication, no root login, max 3 auth tries, no X11/TCP forwarding | Technical | Preventive | ehr-srv-01 | Artifact 2 |
| C-005 | Password Policy | Administrative policy requiring 8+ chars, complexity, 90-day rotation, lockout after 5 attempts | Administrative | Preventive | All user accounts | Artifact 3 |
| C-006 | Endpoint Antivirus | Sophos Endpoint Protection deployed on 372 workstations; 88.1% have current signatures | Technical | Preventive | Windows workstations | Artifact 4 |
| C-007 | Backup & Recovery | Veeam nightly full backup of selected VMs to local NAS (14-day retention) | Technical | Corrective | Critical VMs (ehr-srv-01, ehr-db-01, billing-srv-01, etc.) | Artifact 5 |
| C-008 | Physical Security Guard | ClearView Security provides one guard at Central main entrance, Mon–Fri 07:00–19:00 for visitor sign-in and badge verification | Physical | Deterrent | Central main entrance / visitors | Artifact 6 |
| C-009 | Camera Surveillance | Analog cameras at Central (main, ER, parking) and Westside front entrance; footage stored locally (DVR/SD) | Physical | Detective | Central/Westside entrances | Artifact 6 |
| C-010 | Security Awareness Training | Annual “CyberSafe Basics” online training covering passwords, phishing, physical security | Administrative | Preventive | All employees | Artifact 7 |
| C-011 | Local Logging | FortiGate stores logs locally (30 days); Windows servers use Event Viewer; Linux writes to /var/log; Apache rotates weekly | Technical | Detective | Firewall, servers, web logs | Artifact 8 |
| C-012 | Account Lockout (AD GPO) | Active Directory Group Policy enforces account lockout after 5 failed attempts for 30 minutes | Technical | Preventive | User accounts | Artifact 3 |

---

# Control Summary Matrix

| Category | Preventive | Detective | Corrective | Compensating | Deterrent |
|----------|------------|-----------|------------|--------------|-----------|
| **Technical** | C-001, C-002, C-003, C-004, C-006, C-012 | C-011 | C-007 | | |
| **Administrative** | C-005, C-010 | | | | |
| **Physical** | | C-009 | | | C-008 |

---

**Empty cells represent potential gaps:**
- **Technical Detective** – only local logging (C-011), no centralized SIEM or alerting.
- **Administrative Detective** – no documented monitoring or audit processes.
- **Administrative Corrective** – no formal incident response plan or remediation procedures.
- **Compensating controls** – none identified in provided artifacts.
- **Physical Preventive** – server room access uses generic badge, no additional physical barrier or visitor log.
- **Physical Corrective** – no documented recovery for physical incidents (fire/flood).
