# Threat Modeling: IoT Smart Thermostat

## IoT-Specific Threats (Not Typical for Web Applications)

1. **Physical Tampering / Hardware Reverse Engineering** – An attacker with physical access can open the device, access debug interfaces (UART, JTAG), dump firmware, and extract secrets such as Wi-Fi credentials, API keys, or encryption keys. Web applications rarely face direct hardware attacks.

2. **Weak Default Credentials** – Many IoT devices ship with well-known default usernames and passwords (e.g., `admin/admin`). If users do not change them, attackers can remotely access the device over the internet. Web apps also face this, but IoT devices often lack forced password changes or account lockout.

3. **Unencrypted Local Communications** – The thermostat may use plaintext HTTP, MQTT, or Telnet on the home network. An attacker on the same Wi-Fi can sniff temperature data, send false commands, or capture credentials. This is an IoT-specific risk because local network protocols often omit encryption.

4. **Firmware Vulnerabilities and Insecure OTA Updates** – Firmware may contain buffer overflows, hardcoded backdoors, or lack signature verification. An attacker can push malicious firmware that gives them persistent control. Web apps receive patches differently and are less exposed to physical firmware attacks.

5. **Lack of Secure Boot / Trusted Execution** – The device may not verify the integrity of its own firmware at startup. If compromised, the malicious firmware persists and cannot be removed by a reboot. Web applications do not have this boot-level attack surface.

6. **Privacy Data Leakage via Sensor Data** – Temperature and occupancy patterns can reveal when a home is empty, the number of occupants, and daily routines. This is an IoT-specific privacy threat because the device continuously collects physical environment data.

7. **Exposed Debug Interfaces and Network Services** – Many IoT devices leave debug ports (Telnet, SSH, UART) active in production. These are rarely present in web applications and provide direct access to the underlying operating system.

---

## Physical Access Attack Chain and Potential Impacts

**Attack Chain:**

1. **Gain Physical Access** – The attacker obtains the thermostat (e.g., steals it, buys a used one, or accesses it briefly during installation or maintenance).
2. **Open the Enclosure** – The attacker removes the cover and locates internal components.
3. **Identify Debug Interfaces** – The attacker finds UART, JTAG, or SPI flash pins on the PCB.
4. **Dump Firmware / Memory** – Using a flash programmer or debug interface, the attacker extracts the firmware or reads live memory.
5. **Extract Secrets** – From the dumped firmware or memory, the attacker retrieves Wi-Fi credentials, cloud API keys, private keys, and configuration data.
6. **Exploit Credentials** – The attacker uses extracted credentials to join the home Wi-Fi network, access cloud accounts, or communicate with other connected devices.
7. **Plant Persistent Backdoor** – The attacker may flash modified firmware onto the device, turning it into a permanent backdoor on the network.

**Potential Impacts:**

- **Full home network compromise** – Attacker gains access to all devices on the same network.
- **Theft of personal data** – Temperature patterns reveal occupancy habits; stored cloud credentials may expose user accounts.
- **Physical safety risk** – Attacker can turn off heating in winter or air conditioning in summer, causing discomfort or health hazards.
- **Privacy invasion** – Continuous sensor data allows the attacker to learn daily routines and when the home is empty.
- **Persistent access** – Malicious firmware survives reboots and may evade detection.
- **Reputation damage** – The manufacturer may face recalls, legal action, and loss of consumer trust.

---

## OTA (Over-The-Air) Update Security Controls

Essential security requirements for a secure OTA update process:

1. **Code Signing** – Every firmware image must be digitally signed by the manufacturer. The device verifies the signature before installing. This prevents attackers from distributing unsigned or malicious firmware.

2. **Secure Boot** – At power-on, the device verifies the integrity and authenticity of the bootloader and firmware. If verification fails, the device refuses to boot or enters recovery mode. This ensures only trusted firmware runs.

3. **Encrypted and Authenticated Channel** – OTA updates must be delivered over TLS 1.2 or higher. The device must verify the server certificate to prevent man-in-the-middle attacks. All update traffic must be encrypted and integrity-protected.

4. **Rollback Protection** – The device must reject firmware versions lower than the current version. This prevents an attacker from downgrading to an older, vulnerable version.

5. **Atomic Update with Fallback** – The update must be applied in an all-or-nothing manner. If the update fails or the device fails to boot after update, it must automatically roll back to the previous known-good firmware. This ensures the device remains functional.

6. **Mutual Authentication** – The device authenticates the update server, and the server authenticates the device. This prevents unauthorized devices from receiving updates and prevents malicious servers from delivering firmware.

7. **Secure Key Storage** – Cryptographic keys used for signature verification and secure boot must be stored in a secure element, TPM, or other tamper-resistant hardware. Software-only storage is vulnerable to extraction.

8. **Version and Metadata Verification** – The device must verify the firmware version, hardware model compatibility, and other metadata before installation. This prevents installation of firmware intended for a different device.

9. **Update Integrity Verification** – The device must verify the hash of the downloaded firmware against a signed manifest. Any mismatch aborts the update.

10. **Anti-Tamper Detection** – The device should detect physical tampering and respond by wiping secrets or disabling the update mechanism. This protects keys even if the attacker has physical access.

---

**References:**
- OWASP IoT Top 10
- NISTIR 8259, "Foundational Cybersecurity Activities for IoT Device Manufacturers"
- ENISA, "Baseline Security Recommendations for IoT"
