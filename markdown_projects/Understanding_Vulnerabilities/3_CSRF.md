# Cross-Site Request Forgery (CSRF)

This is a blog post on CSRF, its impact, and mitigations.


## 1. Introduction to CSRF

Cross-Site Request Forgery or CSRF is an attack that forces an authenticated user's browser to send an unwatned request to a web application without the user's knowledge or consent. This can be done by tricking the user into clicking a link, or visiting a malicious page that triggers a request to a site where the user is already logged in. For example, if the user has already logged into his online banking website, and he clicks on a malicious link which sends a redirect to the bank website with a malicous request, the user would already be authenticated with the bank website, resulting in the malicious request being executed.

CSRF is a significant threat because it bypasses authentication and is usually completely invisible and undetectable to the victim.


## 2. Historical Context

CSRF first emerged in the 2000s as web applications became more interactive. Early examples involved \<img> tags that triggered GET requests. In the late 2000s the SameSite cookie attribute started being added which is by now default on modern browsers. Since the 2010s a lot more frameworks have added CSRF protections.


## 3. Impact of CSRF Attacks

As I described in the hypothetical scenario in the introduction there is a potential impact against victims, where their bank account could execute a transfer without their knowledge or permission. CSRF can also be used for account takeover by changing the victim's email or password for the targeted website or web service. Depending on what account is being attacked with CSRF, there could be an impact on data integrity and confidentiality or further privilige escalation and code execution.


## 4. Mitigation Strategies

There are good strategies for mitigation against this type of attack such as Anti-CSRF tokens which are unique, unpredictable tokens that are requried by the server for any client request which changes a state (like updating a password). This token cannot be guessed by the attacker so the malicious packets they create will not be accepted by the server. Another prevention method is the SameSite cookie attribute which I mentioned in the historical context section, it prevents the browser from sending cookies with cross site requests, effectively making it impossible for CSRF to work.


## Conclusion

This blog post was an overview on CSRF vulnerabilites and their impact. Readers are urged to make sure their web applications are using preventative measures such as Anti-CSRF tokens to protect its users against such an attack. Staying vigilant of such threats is key.

Come back next time for a look into patches :)
