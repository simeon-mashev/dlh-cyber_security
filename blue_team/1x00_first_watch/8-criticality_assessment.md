# Asset Criticality Assessment

## Asset Criticality Matrix

| Asset Category | Confidentiality | Integrity | Availability | Overall Criticality | Justification |
|----------------|-----------------|-----------|--------------|---------------------|---------------|
| **EHR System** | Critical | Critical | Critical | **Critical** | Contains PHI for ~50,000+ patients. Any compromise (breach, alteration, downtime) directly threatens patient safety, violates HIPAA, halts clinical operations, and triggers mandatory regulatory notifications. |
| **PACS/Imaging** | High | High | High | **High** | Medical images are essential for diagnosis and treatment. Loss or alteration could lead to misdiagnosis; downtime delays care but rarely immediate life-threatening if EHR still available. |
| **Billing Infrastructure** | High | High | High | **High** | Claims processing is required for revenue. Downtime (like Incident A) halts cash flow; integrity loss causes claim rejections; confidentiality breach exposes financial data and PII. |
| **Network Core & Perimeter** | High | High | Critical | **Critical** | Flat network connects all systems. Compromise of core switch/firewall grants access to every asset; network outage brings down all clinical and administrative operations. |
| **Medical IoT Devices** | High | Critical | Critical | **Critical** | Infusion pumps and patient monitors directly affect patient safety. Malicious alteration of dosages or monitoring could cause immediate harm; unsegmented network means any compromise spreads to other devices. |
| **Clinical Endpoints** | High | Medium | Medium | **High** | Workstations used by clinicians access EHR and medical devices. Compromise could expose PHI or serve as pivot point; downtime moderately impacts workflow but can be worked around with paper. |
| **Administrative Endpoints** | Medium | Medium | Medium | **Medium** | Used by finance, HR, IT. Compromise may expose employee PII and credentials but does not directly affect patient care. |
| **Data Storage & Backup** | Critical | Critical | High | **Critical** | NAS and backup server hold copies of EHR, billing, and other critical data. If backups are compromised or destroyed (e.g., ransomware), recovery becomes impossible; confidentiality breach exposes everything. |
| **Physical Security Systems** | Medium | Medium | Medium | **Medium** | Badge access and cameras protect physical areas. Compromise could allow unauthorized physical access, but direct impact on patient data is indirect. |
| **Public-Facing Web/Portal** | High | Medium | High | **High** | Patient portal exposes patient data and is internet-facing. Breach (like Incident B) leaks PHI; defacement (Incident D) damages reputation and may affect patient trust. |

---

## Top 5 Most Critical Assets

1. **EHR System (ehr-srv-01, ehr-db-01)**  
   The EHR is the central nervous system of MedDefense. It contains complete patient records, medication orders, lab results, and clinical notes for tens of thousands of patients. A confidentiality breach triggers HIPAA breach notification, federal investigations, and loss of patient trust. Integrity failure could cause incorrect treatments or prescriptions, directly endangering lives. Availability outage (as in Incident E) forces paper records and delays care. No other asset has this combination of patient safety, regulatory, and operational impact.

2. **Network Core & Perimeter (FortiGate, core switch)**  
   The flat network architecture means the core switch and firewall are single points of control for all traffic. An attacker who compromises the core can reach every server, workstation, and medical device. A firewall misconfiguration or failure can cut off connectivity to Westside and HQ, halting all operations. Because there is no segmentation, the network core is the gatekeeper—and currently it is a wide-open gate.

3. **Medical IoT Devices (Infusion Pumps, Patient Monitors)**  
   These devices are directly involved in patient care. Infusion pumps deliver medications; altering their operation could cause overdose or underdose. Patient monitors track vital signs; tampering could hide a patient's deterioration. The BD Alaris firmware has known CVEs, and all devices are on the same network as workstations. A successful attack on these devices is not just a data breach—it is a potential mass-casualty event.

4. **Data Storage & Backup (NAS-01, backup-srv-01)**  
   The backup NAS holds the only recovery copies of critical systems. It sits in the same rack as the servers it backs up, with no offsite replication. If ransomware reaches the NAS (and nothing stops lateral movement), MedDefense loses both production data and backups simultaneously. The organization cannot recover from a major incident without this asset; its compromise would be catastrophic and potentially unrecoverable.

5. **Billing Infrastructure (billing-srv-01)**  
   Billing is how MedDefense gets paid. Incident A already demonstrated the impact: 4 days of no claims processing, significant revenue loss. Beyond availability, the billing database contains insurance and payment information that is both PHI and financial data. A confidentiality breach triggers multiple regulatory obligations (HIPAA, PCI) and damages payer relationships. Without billing, the organization cannot sustain operations for long.
