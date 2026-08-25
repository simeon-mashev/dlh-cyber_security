# Quick Reference Guide: Data Classification at HealthPlus Medical Group

## Data Classification Levels

| Level | Examples | Key Rule |
|-------|----------|----------|
| **PUBLIC** | Marketing, website | No restrictions |
| **INTERNAL** | Memos, org charts | Keep inside company |
| **CONFIDENTIAL** | Employee PII, financials | Encrypt and restrict access |
| **RESTRICTED** | Patient records, credentials | Strictest controls; always encrypt; access only on need-to-know |

## Handling Cheat Sheet

| Action | PUBLIC | INTERNAL | CONFIDENTIAL | RESTRICTED |
|--------|:------:|:--------:|:------------:|:----------:|
| Label? | No | Yes | Yes | Yes |
| Encrypt at rest? | No | Optional | Yes | Yes |
| Encrypt in transit? | Optional | Yes | Yes | Yes |
| Send via normal email? | Yes | Yes (internal only) | No – use encrypted email/file transfer | No – use secure file transfer only |
| Store on personal device? | Yes | No | No | No |
| Throw in regular trash? | Yes | Recycle/shred | Shred | Shred + log |

## Quick Rules

- If you don't know the classification, treat it as **CONFIDENTIAL**.
- **RESTRICTED** data (PHI, credentials) must never leave approved encrypted systems without explicit approval.
- **Report** any suspected mishandling to the IT Security Team immediately.
- **Label** CONFIDENTIAL and RESTRICTED files/emails clearly.
- **Lock your screen** when away from your workstation.
- **Shred or secure-delete** all CONFIDENTIAL/RESTRICTED data before disposal.

**Need help?** Contact the IT Security Team: security(@)healthplus.com
