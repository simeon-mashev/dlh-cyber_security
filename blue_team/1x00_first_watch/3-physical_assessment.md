# Risk Decomposition: Walk-Through Observations

## Observation 1: Server Room Access

- **Vulnerability:** Server room uses the same generic employee badge for access; no camera, no visitor log.
- **Threat:** Any employee, visitor, or intruder with a generic badge can enter the server room unnoticed.
- **Impact:** Unauthorized physical access to critical servers and infrastructure could lead to data theft, tampering, or destruction (Confidentiality, Integrity, Availability).
- **Severity:** **Critical** — direct access to core IT infrastructure without monitoring or audit trail enables a wide range of severe attacks.

---

## Observation 2: Network Closet

- **Vulnerability:** Unlocked network closet with ajar door; credentials for switch management posted on the wall.
- **Threat:** An attacker or disgruntled employee can enter, read the credentials, and reconfigure or disable the network.
- **Impact:** Network traffic interception, device compromise, or network outage (Confidentiality, Integrity, Availability).
- **Severity:** **Critical** — physical access plus exposed admin credentials allows full network control.

---

## Observation 3: Nurse Station

- **Vulnerability:** EHR workstation left logged in with patient record visible; no auto-lock or logout; sign encourages staying logged in.
- **Threat:** An unauthorized person (visitor, patient, or staff) can view, modify, or exfiltrate patient data from the open session.
- **Impact:** Patient data breach (Confidentiality) or unauthorized changes to records (Integrity).
- **Severity:** **High** — clinical data exposure and tampering risk, though limited to one workstation at a time.

---

## Observation 4: Medical IoT

- **Vulnerability:** Connected vital signs monitor exposes diagnostic data, IP address, and old firmware; same network segment as workstations.
- **Threat:** An attacker on the network can target the outdated device to capture patient data or pivot into the hospital network.
- **Impact:** Data exposure (Confidentiality), device manipulation (Integrity), or service disruption (Availability).
- **Severity:** **High** — medical device compromise can affect patient safety and network security.

---

## Observation 5: Emergency Exit

- **Vulnerability:** Fire exit propped open between public area and restricted administrative wing, with sign encouraging it.
- **Threat:** Any member of the public can walk through the open door into restricted areas containing IT and executive offices.
- **Impact:** Unauthorized physical access to sensitive areas, potential data theft or vandalism (Confidentiality, Integrity, Availability).
- **Severity:** **High** — bypasses physical security controls and exposes high-value areas to unmonitored access.
