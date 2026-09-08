# Incident Classification Table

| Incident | Primary CIA Pillar | Justification | Secondary CIA Pillar | Connection |
|----------|-------------------|---------------|---------------------|------------|
| **A** | Availability | Billing server encrypted; finance team could not process claims for 4 days. | Integrity | Ransomware modified/encrypted data on billing-srv-01. |
| **B** | Confidentiality | Broken access control allowed any authenticated patient to view other patients' lab results. | None | — |
| **C** | Integrity | Database script bug overwrote medication dosage values, displaying incorrect dosages. | Availability | Pharmacy system displayed incorrect data for 6 hours, affecting clinical operations. |
| **D** | Integrity | Public website homepage was replaced with unauthorized political message. | Availability | Website was down/defaced for 2 hours until restored. |
| **E** | Availability | EHR system outage for 9 hours during migration; rollback untested. | None | — |
| **F** | Confidentiality | Torrent client on intern's laptop sharing files; laptop had access to HR file share network segment. | Availability | Potential bandwidth/resource consumption from torrent client. |
