# Calculate CVSS

**Vulnerability Scenario:** A remote code execution vulnerability in a widely used web server software. The vulnerability allows an attacker to execute arbitrary code remotely without requiring authentication.

In this scenario let's analyse each CVSS Metric to input into the calculator and get a score out of 10.

The attack vector in this case is "Network" as it is a web software vulnerability. The attack complexity is "Low", based off the description which makes it sound easily reproducable. The priviliges required are "None" as the description claims it is executable without authentication. The user interaction is "none" as the description doesn't mention any user interaction. The scope is "Changed" because an RCE (Remote Code Execution) exploit means that an atacker can execute any code and thus the scope goes beyond the web program through which he/she gained access. The fact that this is an RCE also direclty means that the loss of Confidentiality, Integrity, and Availability is "High".

After putting all these values into the [calculator](https://cuberk.com/cvss/v3-1/) we get a CVSS score of 9.8 which gives us a critical severity for this vulnerability. Any company using this web software must immediately patch it or, if no patch is available, find another workaround to prevent an attack.
