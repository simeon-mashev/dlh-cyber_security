# Structured Environment Summary

## 1. Organization Overview

### Sites

| Name | Location Type | Function/Departments | Approx. Headcount |
|------|---------------|----------------------|-------------------|
| MedDefense Central Hospital | 350-bed acute care facility | Emergency, Surgery, Cardiology, Radiology, Oncology, Pediatrics, Maternity, Pharmacy, Laboratory, Administration | 1,400 |
| Westside Clinic | Outpatient facility | Primary care, diagnostic imaging (X-ray, ultrasound), blood work, minor procedures, physical therapy | 180 |
| Corporate HQ | Administrative offices | Finance, HR, Legal, Marketing, Executive Leadership, IT | 220 |

### Reporting Structure

- **CEO: Dr. Patricia Morales**
  - **CFO: Robert Kim**
  - **COO: Angela Torres**
    - **Clinical Directors** (per department)
  - **General Counsel: David Park**
  - **CISO (vacant — James Chen is Deputy CISO, acting)**
    - **James Chen, Deputy CISO**
      - **Security Analyst:** Simeon Mashev
    - **Sarah Park, IT Director**
      - 3x System Administrators
      - 2x Network Technicians
      - 1x Database Administrator
      - 2x Helpdesk Analysts (incl. Mike Torres, lead)
      - 2x Desktop Support Technicians
      - 1x IT Intern (vacant)

---

## 2. IT Infrastructure Identified

### Servers

| Name | Function | Location | Technical Notes |
|------|----------|----------|-----------------|
| ehr-srv-01 | EHR Application Server | Central | Ubuntu 20.04 LTS |
| ehr-db-01 | EHR Database (PostgreSQL) | Central | Ubuntu 20.04 LTS; DB accessible from whole 10.10.0.0/16 |
| pacs-srv-01 | PACS Imaging Server | Central | Windows Server 2016; shared login `raduser` / `radiology1` |
| billing-srv-01 | Billing/Claims Processing | Central | Ubuntu 18.04 LTS; recurring performance issues |
| ad-dc-01 | Primary Domain Controller | Central | Windows Server 2019 |
| ad-dc-02 | Secondary Domain Controller | Central | Windows Server 2019 |
| file-srv-01 | Department File Shares | Central | Windows Server 2016 |
| print-srv-01 | Print Server | Central | Windows Server 2012 R2; [UNVERIFIED]; EOL Oct 2023 |
| backup-srv-01 | Backup Server (Veeam agent) | Central | Ubuntu 22.04 LTS; backups to local NAS same rack |
| web-srv-01 | Public Website + Patient Portal | Central (DMZ) | Ubuntu 20.04 LTS |
| ws-srv-01 | Local file server + scheduling | Westside | Windows Server 2016 |
| Unknown server | Possible additional server | Westside | Mentioned by Mike Torres, not confirmed |

**Backup storage:** Local NAS in same server room (no offsite).

### Network Equipment

| Device | Location | Notes |
|--------|----------|-------|
| Fortinet FortiGate 100F | Central | Perimeter firewall; no segmentation |
| Cisco core switch (model unknown) | Central | Core |
| Cisco access switches (2 per floor) | Central | Floor switches |
| Ubiquiti UniFi APs (12) | Central | WiFi |
| Unmanaged switch (brand unknown) | Westside | No management |
| Netgear Nighthawk consumer router | Westside | No firewall; IPSec VPN to Central runs on it |
| Building-managed VLAN | Corporate HQ | MedDefense has own VLAN; site-to-site VPN to Central |
| Guest WiFi SSID | Central | Separate SSID; isolation unverified |

**Topology:** Flat network `10.10.0.0/16` at Central; no VLANs; servers, workstations, medical devices all in same broadcast domain. Westside connects via IPSec VPN through consumer router. HQ via site-to-site VPN.

### Endpoints

| Category | Quantity | Location | Notes |
|----------|----------|----------|-------|
| Windows 10 workstations | ~320 | Central | Count from AD report 8 months old |
| Thin clients | ~60 | Central | Clinical areas |
| iPads (physician rounds) | ~25 | Central | Managed? unclear |
| Windows 10 workstations | ~45 | Westside | |
| Windows 10/11 workstations | ~120 | HQ | |
| Laptops (remote-capable) | ~30 | HQ | |
| **Total** | **~600** | | Incomplete count |

### Medical Devices / IoT

| Device | Quantity | Location | Notes |
|--------|----------|----------|-------|
| Philips IntelliVue patient monitors | ~80 | Central | On flat network |
| BD Alaris infusion pumps | ~120 | Central | Network-connected for dosage updates |
| Siemens MAGNETOM MRI | 1 | Central (Radiology) | Runs Windows XP (critical) |
| GE Revolution CT | 1 | Central | OS unknown |
| Nurse call system | IP-based | Central | Integrated with phone system |
| HID Global badge/access | 1 | Central | Connected to AD for some doors |

### Security & Software

| Tool / Service | Status |
|----------------|--------|
| Sophos Endpoint Protection | Installed; currency on all machines unknown |
| Microsoft O365 E3 | Org-wide; main cloud service |
| Veeam Backup | Backs up to local NAS only |
| Fortinet support | Active |
| MedTech Solutions EHR maintenance | Software updates only; SLA 4hr critical / 24hr standard |
| ClearView Security guard | Central main entrance only, Mon-Fri 7AM-7PM; no weekend/night; none at Westside/HQ |

---

## 3. Data and Services

### Types of Data

- **PHI** – patient records, diagnoses, prescriptions, imaging, lab results
- **PII** – employee and staff information
- **Financial / Billing** – claims, billing data
- **Operational** – internal files, schedules, email, credentials
- **Research** – (implied, not explicitly documented)

### Critical Services

| Service | Depends On | Primary Users |
|---------|-----------|---------------|
| EHR | ehr-srv-01, ehr-db-01, MedTech Solutions | Clinicians, nurses, physicians |
| PACS Imaging | pacs-srv-01 | Radiologists |
| Billing / Claims | billing-srv-01 | Finance |
| Patient Portal | web-srv-01 | Patients |
| Directory / Auth | ad-dc-01, ad-dc-02 | All users |
| File Sharing | file-srv-01, ws-srv-01 | Departments |
| Email / O365 | O365 E3 | All users |
| VPN / Remote | FortiGate, Netgear, HQ building network | Remote workers, HQ/Westside staff |
| Backup | backup-srv-01, local NAS | IT |

### Users

- **Clinical staff** – physicians, nurses, rad techs, pharmacists (EHR, PACS, nurse call, medical devices)
- **Administrative staff** – finance, HR, legal, marketing (O365, file shares, billing)
- **IT department** – system/network/helpdesk (manage infrastructure)
- **Patients** – patient portal
- **Third parties** – MedTech Solutions, building management, ClearView Security

---

## 4. Known Unknowns

- **Asset inventory:** incomplete; endpoint count from AD 8 months old; print-srv-01 unverified; possible missing server at Westside.
- **Endpoint security:** Sophos currency unknown; patch levels unknown; iPad management unclear.
- **Network:** exact Cisco core model unknown; Westside switch brand unknown; diagram simplified; real topology messier per Marcus; guest WiFi isolation unverified.
- **Cloud services:** only O365 identified; other department clouds suspected but not documented.
- **Medical devices:** CT OS unknown; MRI runs Windows XP; no IoT security assessment; pumps/monitors on flat network.
- **Authentication:** no MFA except James’s account; shared `raduser` account; SSH password auth enabled on most Linux servers.
- **Physical security:** server room generic badge; no cameras in server corridor; Westside server closet no lock; guard service limited weekdays only.
- **Backup:** local only; no offsite/cloud; ransomware risk unaddressed.
- **Incident/BCP/DR:** no formal IR plan; no BCP/DR; January ransomware handled ad-hoc.
- **Compliance:** HIPAA Security Rule never formally assessed; Legal claims compliance without evidence.
- **Assessment gaps:** no vulnerability assessment; no endpoint security evaluation; no threat landscape analysis.
- **Unverified/unconfirmed:** many `[UNVERIFIED]` items; Marcus’s notes may be outdated.
