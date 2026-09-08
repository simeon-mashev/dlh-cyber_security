# Asset Registry

| Asset ID | Name | Type | Location | Owner (Dept) | OS/Platform | Critical Services | Network Segment | Status | Notes |
|----------|------|------|----------|---------------|-------------|-------------------|-----------------|--------|-------|
| A-001 | ehr-srv-01 | Server | Central | IT | Ubuntu 20.04 LTS | EHR Application | 10.10.2.10 | Active | SSH key-only (C-004); DB access from flat network |
| A-002 | ehr-db-01 | Server | Central | IT | Ubuntu 20.04 LTS | EHR Database (PostgreSQL) | 10.10.2.11 | Active | PostgreSQL accessible from entire 10.10.0.0/16 |
| A-003 | pacs-srv-01 | Server | Central | Radiology | Windows Server 2016 | PACS Imaging | 10.10.2.12 | Active | Shared login `raduser`; no backup |
| A-004 | billing-srv-01 | Server | Central | Finance | Ubuntu 18.04 LTS | Billing/Claims | 10.10.2.15 | Active | Incident A ransomware; MySQL exposed; no backup? |
| A-005 | ad-dc-01 | Server | Central | IT | Windows Server 2019 | Domain Controller | 10.10.2.20 | Active | Primary DC; no alerting on AD logs |
| A-006 | ad-dc-02 | Server | Central | IT | Windows Server 2019 | Domain Controller | 10.10.2.21 | Active | Secondary DC; not backed up |
| A-007 | file-srv-01 | Server | Central | IT | Windows Server 2016 | Department File Shares | 10.10.2.30 | Active | Shared files; access from all subnets |
| A-008 | print-srv-01 | Server | Central | IT | Windows Server 2012 R2 | Print Server | 10.10.2.31 | Active (EOL) | End of support Oct 2023; unverified |
| A-009 | backup-srv-01 | Server | Central | IT | Ubuntu 22.04 LTS | Veeam Backup | 10.10.2.40 | Active | Backs up to NAS-01; no offsite |
| A-010 | NAS-01 | Data Store | Central | IT | Synology DSM 7 | Backup Target | 10.10.2.41 | Active | Same rack as servers; accessible from entire network |
| A-011 | web-srv-01 | Server | Central (DMZ) | IT | Ubuntu 20.04 LTS | Public Website + Patient Portal | 10.10.2.50 | Active | In DMZ; portal had broken access control (Incident B) |
| A-012 | ws-srv-01 | Server | Westside | IT | Windows Server 2016 | Local file server + scheduling | 10.10.10.10 | Active | Not backed up; RDP exposed |
| A-013 | WS-RAD-01 | Endpoint | Central | Radiology | Windows XP SP3 | MRI Control Workstation | 10.10.1.70 | Active (EOL) | End of life; MRI runs Windows XP |
| A-014 | LAPTOP-HQ-01 | Endpoint | HQ | IT | Windows 11 | Remote Work | 10.10.20.200 | Active | Intermittent; from scan |
| A-015 | TC-ER-01 | Endpoint | Central | IT | Linux thin client | Clinical Access | 10.10.1.100 | Active | Thin client in ER |
| A-016 | iPad-Physicians | Endpoint | Central | IT | iOS | Physician Rounds | (not in scan) | Unknown | No MDM; management unclear |
| A-017 | FortiGate 100F | Network Device | Central | IT | FortiOS | Perimeter Firewall | Edge | Active | Rule 4 allows all outbound; VPN rules too permissive |
| A-018 | Cisco Core Switch | Network Device | Central | IT | Cisco IOS | Network Core | 10.10.0.0/16 | Active | Flat network; no VLANs |
| A-019 | AP-1F-01 | Network Device | Central | IT | Ubiquiti UniFi | WiFi Access | 10.10.1.200 | Active | Guest WiFi isolation unverified |
| A-020 | Netgear Router | Network Device | Westside | IT | Netgear firmware | Internet/VPN | 10.10.10.1 | Active | Consumer-grade; no firewall; IPSec VPN to Central |
| A-021 | MON-ICU-01 | IoT Medical | Central | Clinical Engineering | Philips IntelliVue | Patient Monitoring | 10.10.3.10 | Active | Web interface exposed; flat network |
| A-022 | PUMP-ICU-01 | IoT Medical | Central | Clinical Engineering | BD Alaris fw 12.1.2 | Infusion Pump | 10.10.3.40 | Active | Known CVEs; no segmentation |
| A-023 | NURSE-CALL-01 | IoT Medical | Central | IT | IP-based | Nurse Call | 10.10.3.50 | Active | Integrated with phone; web interface |
| A-024 | BADGE-READER-MAIN | IoT Medical | Central | Facilities | HID Global | Door Access | 10.10.3.60 | Active | Connected to AD for some doors |
| A-025 | 10.10.2.99 (UNKNOWN-01) | Unknown | Central | Unknown | Linux 4.x | SSH, Web (8888, 9090) | 10.10.2.99 | Shadow IT | Not in documentation; possible Marcus's or intern's |
| A-026 | 10.10.10.200 (Unknown device) | Unknown | Westside | Unknown | Linux 5.x | SSH, Web (3000) | 10.10.10.200 | Shadow IT | Not in documentation; Grafana/Node.js? |

---

# Reconciliation Notes

## Assets Found in Network Scan but Not in Any Documentation

- **10.10.2.99 (UNKNOWN-01)** – Central server subnet. Linux device with SSH and two web services (8888, 9090). No DNS name. Not in any IT documentation.
- **10.10.10.200** – Westside subnet. Linux device with SSH and port 3000 (Grafana/Node.js possible). Not documented.

These are potential **Shadow IT** or rogue devices. They require immediate investigation.

## Assets Mentioned in Documentation but Not Appearing in Network Scan

- **MRI scanner (Siemens MAGNETOM)** – The physical scanner itself does not have a network presence in the scan; only its control workstation (WS-RAD-01) appears. The scanner may be isolated from the network or powered off during scan.
- **CT scanner (GE Revolution)** – Mentioned in onboarding packet but not in network scan. OS unknown; may be off network or powered off.
- **Unmanaged switch at Westside** – Mentioned in onboarding but not a managed device; cannot be detected by scan.
- **iPads** – Mentioned in onboarding (25 units) but not in scan; likely no wired IP or not detected.
- **Possible second server at Westside** – Mentioned by Mike Torres but never confirmed; not in scan.

## Discrepancies and Contradictions

- **print-srv-01** – Onboarding packet says Windows Server 2012 R2, scan shows Windows Server 2012 (could be same or minor version discrepancy).
- **billing-srv-01** – Onboarding says Ubuntu 18.04; scan confirms 18.04. No discrepancy.
- **Backup NAS** – Onboarding packet says "NAS in same server room"; scan shows NAS-01 at 10.10.2.41 with management interface accessible network-wide.
- **Flat network** – Onboarding and Marcus's notes say no segmentation; scan confirms all subnets reachable from HQ workstation without restrictions.
- **Endpoint counts** – Onboarding estimates ~320 workstations at Central, scan detects "approximately 290 additional Windows workstations" plus listed ones, so total around 320; count consistent but not exact.
- **Medical device firmware** – Onboarding mentions monitors and pumps; scan reveals BD Alaris firmware 12.1.2 with known CVEs; no mitigation applied.
- **Westside subnet** – Onboarding says no firewall at Westside, consumer router; scan shows Netgear router at 10.10.10.1, confirming.
- **Corporate HQ** – Onboarding says no on-prem servers; scan shows only workstations and laptops, consistent.
