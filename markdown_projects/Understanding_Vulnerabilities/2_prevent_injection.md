# Prevent Injection

A blog post about Injection type vulnerabilities and their prevention

## Introduciton to Injection Attacks

Injection type attacks are one of the most common type of attack against a software system. Injection vulnerabilities are listed in 5th place in the OWASP top10 2025. Injection essentially refers to any type of attack where an attacker can "inject" a command into a system. The impact of this can range from gaining access to data you're not supposed to have to being able to execute code and escalate privileges. The 2 most common types of injection vulnerabilities are SQL Injection which usually results in exposed data, and command injections which may result in a lot more.


## Preventing Injection Attacks

There are multiple ways of preventing SQL vulnerabilities in your systems. One of the most important ways which everyone should implement in their coding practices is input validation and sanatization. If you have an input field for a first name you must verify that what has been inputted is only letters up to a certain string lenght. If there is a field for "nubmer of orders", you must verify that the input string only has characters 0-9 and that there is a limit to how many of those characters there is.

Another prevention method is the principle of least privilege. This is the general principle that any file, user, service should have the least priviliges needed to execute its function. In the context of injections this means that if a user input will be stored on a linux server, the resulting file it's stored in shouldn't have any execute privileges and remain read-only.

Great tools for injection vulnerability scanning include SQLMap, OWASP ZAP, and Burp Suite.


## Conclusion

This blog post was a short overview of injection attacks, their impact, and injection vulnerabiity prevention. It is a very common type of vulnerability which needs to be prevented in software systems


Come back next time for a blog post on CSRF :)
