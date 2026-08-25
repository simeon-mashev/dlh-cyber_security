# Technical Standards: Password and Authentication

## 1. Password Hashing Algorithms

| Algorithm | Minimum Settings | Notes |
|-----------|------------------|-------|
| Argon2id | Memory: 64 MB, Iterations: 3, Parallelism: 1 | Recommended for new systems |
| bcrypt | Cost factor: 12 or higher | Widely supported |
| PBKDF2 | 600,000 iterations (SHA-256 or SHA-512) | Acceptable if Argon2/bcrypt not available |
| scrypt | N=2^17, r=8, p=1 | Acceptable alternative |

**Prohibited:** MD5, SHA-1, SHA-256 without key stretching, unsalted hashes.

## 2. MFA Approved Methods

| Method | Description | Typical Use |
|--------|-------------|-------------|
| Time-based One-Time Password (TOTP) | Software or hardware token generating a 6-digit code | Standard for users and remote access |
| Push Notification | Mobile app approval with biometric | Preferred for workforce |
| Hardware Token (U2F/FIDO2) | Physical key requiring tap | High-security, privileged users |
| Smart Card | Certificate-based authentication | Administrative systems |
| SMS/Email OTP | One-time code sent via SMS/email | Not recommended for high-risk; acceptable as fallback |

**Prohibited:** Voice call OTP (susceptible to SIM swapping).

## 3. Privileged Access Management (PAM) Requirements

- Centralized vault for privileged credentials.
- Automatic password rotation for service and privileged accounts (daily or per policy).
- Session recording and keystroke logging for all privileged sessions.
- Just-in-time (JIT) privilege elevation where possible.
- Individual accountability: no shared privileged accounts.
- Audit logs forwarded to SIEM.

## 4. Password Manager Standards

- Approved password managers: [List approved products]
- Master password must be at least 15 characters and passphrase-style.
- MFA must be enabled on the password manager.
- Cloud-based password managers must encrypt data at rest and in transit.
- Offline password managers must use AES-256 encryption.

## 5. Session Timeout and Lockout Settings

| Parameter | User Accounts | Privileged Accounts |
|-----------|---------------|---------------------|
| Idle Timeout | 15 minutes | 10 minutes |
| Max Failed Attempts | 5 | 5 |
| Lockout Duration | 15 minutes | 30 minutes or manual reset |
| Re-authentication for Sensitive Actions | Yes | Yes |

## 6. Password Reset and Recovery Technical Controls

- Self-service reset portal requires MFA and identity verification.
- Temporary passwords must be randomly generated and expire within 24 hours.
- After reset, user must set a new permanent password on first login.
- Help desk resets require two-person verification or manager approval.
- All reset events are logged and reviewed monthly.
