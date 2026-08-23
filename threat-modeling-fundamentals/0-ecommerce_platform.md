# Threat Modeling: E-commerce Platform

## STRIDE Threats for Checkout Process

### Threat 1: Spoofing - Session Hijacking of Authenticated Checkout

**STRIDE Category** - Spoofing

**Threat Description** - An attacker steals or forges a user’s session cookie (e.g., via XSS, session fixation, or network sniffing) and impersonates the victim to access the checkout and place orders using the victim’s saved payment methods.

**Potential Impact** - Unauthorized purchases, financial fraud, account takeover, loss of customer trust.

**Suggested Mitigation** - Use secure, HttpOnly, SameSite cookies. Implement session expiration and rotation. Require re-authentication for checkout/payment. Use CSRF tokens on checkout forms. Monitor for unusual session activity.


### Threat 2: Tampering - Price Manipulation in Checkout Request

**STRIDE Category** - Tampering

**Threat Description** - An attacker intercepts the checkout request (e.g., using browser dev tools or a proxy) and modifies the total price or product IDs sent to the API. The server accepts the altered amount, resulting in an incorrect charge.

**Potential Impact** - Financial loss for the company; goods sold below cost; inventory and accounting discrepancies.

**Suggested Mitigation** - Never trust client-supplied prices. Recalculate totals server-side from product IDs and current prices. Use signed tokens or server-side session cart validation. Implement input validation and integrity checks (e.g., HMAC) on cart data.


### Threat 3: Information Disclosure - Interception of Payment Data

**STRIDE Category** - Information Disclosure

**Threat Description** - An attacker intercepts network traffic between the user and the API (e.g., on public Wi-Fi) and captures sensitive payment information such as credit card details or Stripe tokens.

**Potential Impact** - Theft of customer payment data, identity theft, fraudulent transactions, PCI DSS non-compliance, legal penalties.

**Suggested Mitigation** - Enforce HTTPS/TLS for all checkout and payment-related traffic. Use Stripe Elements or Stripe.js to handle card data directly, ensuring card details never touch your servers. Implement HSTS. Regularly audit TLS configuration.


## Trust Boundaries

**Boundary 1 - User Browser ↔ React Frontend (Static Content)** - Data crosses from the untrusted user browser to the trusted static hosting server (CDN or web server). The frontend is not inherently trusted; all client-side code can be manipulated.

**Boundary 2 - User Browser ↔ Node.js API Backend** - The API receives requests directly from untrusted clients. This is the most critical boundary—input validation, authentication, and authorization must be enforced here.

**Boundary 3 - Node.js API Backend ↔ PostgreSQL Database** - The backend server sends queries to the database. The database trusts the backend, so any vulnerability in the backend (like SQL injection) can directly compromise the database.

**Boundary 4 - Node.js API Backend ↔ Stripe Payment Gateway** - Sensitive payment data flows between the backend and an external trusted service (Stripe). This boundary requires encrypted communication and careful handling of API keys and webhooks.


## DREAD Scoring: SQL Injection in Product Search

DREAD Formula:<br>
Risk = (Damage + Reproducibility + Exploitability + Affected Users + Discoverability) / 5

| DREAD Factor | Score (0-10) | Justification |
|--------------|:------------:|---------------|
| Damage Potential | 8 | A successful SQL injection in product search could allow an attacker to read, modify, or delete data from the entire database, including customer orders and possibly hashed passwords. |
| Reproducibility | 10 | The attack is highly reproducible; the same malicious input always produces the same result when the vulnerability exists. |
| Exploitability | 8 | Exploitation requires moderate skill, but automated tools like sqlmap can easily find and exploit the flaw if the application concatenates user input into SQL queries. |
| Affected Users | 6 | All users who use the search functionality could be affected, but the impact may be limited to data exposure rather than immediate financial loss for all users. |
| Discoverability | 8 | The search functionality is easy to find and its URL parameters are visible in the browser; a potential attacker can easily test for SQL injection. |


**Total Score:** (8 + 10 + 8 + 6 + 8) / 5 = **8.0**

**Risk Level:** **High**
