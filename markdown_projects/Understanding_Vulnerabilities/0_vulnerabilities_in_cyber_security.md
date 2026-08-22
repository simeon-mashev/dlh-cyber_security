# Vulnerability in Cyber Security

A short blog about vulnerabilites

## 1. Introduction to Vulnerabilities:

### What is a vulnerability in the world of cybersecurity?

A vulnerability is a weakness in the design or implementation of software or hardware, and can be exploited by an attacker, resulting in security goals such as Confidentiality, Integrity, and Availability not being met.

### Why is a vulnerability more than just a simple technical weakness?

A vulnerability is specifically a weakness that CAN be exploited. There may also be weaknesses which aren't exploitable and aren't vulnerabilities. Because of this, a vulnerability is dangerous as attackers across the internet constantly attempt to exploit known vulnerabilities.

### How do vulnerabilities contribute to security breaches in technology-driven organizations?

As I mentioned above, vulnerabilities CAN be exploited. This exploitation means being able to do things which shouldn't be allowed in the target software system. A security breach occurs when an attacker gains access to a system that he is not supposed to have access to. He/She can do this by exploiting a vulnerability.


## 2. Historical Context:

In the early days of computing, vulnerabilities were not a major concern for computing systems. Before the internet, these weakness in implementation and design of software and hardware systems, simply led to unintentional outputs from said systems. These weaknesses were not targets for attackers to exploit.

In 1988 the Morris Worm spread across the early internet demonstrating that vulnerabilities can be weaponized at scale. It is a great early example of malware.

In the past even research on security was less thorough as systems were designed to be secure in a "closed network" type of system, where you assumed that your communication was always safe. Later research until the modern day assumes an "open network" type of system for analysing security, which specifies the constant possiblity of a Man-In-The-Middle (MITM) attack, where an attacker can intercept all messages in a network.

With the rapid expansion of the internet in the 90s and 00s, vulnerabilities became a greater risk and cause for concern for any company related to computer systems, especially in the finance sector, where newly emerging cyber-criminals had the opportunity to make a lot of money by exploiting vulnerabilities. Nowdays, cybersecurity is a vital industry protecting the systems our societies run on, so making sure vulnerabilites are not left to be exploited is of utmost importance.

Another short "fun" anecdote https was first created in 1994, but didn't become the universal standard until the mid 2010s. In the early 2000s using a tool like wireshark could give you a lot of information about web traffic as most of it was unencrypted. Today's security landscape is vastly different as it is incredibly rare to see any website using http instead of https, and even all major browsers warn unaware users of potential risks and threats of going to an unencrypted website.

## 3. Types of Vulnerabilites Explained:

There are different types of vulnerabilites which need different prioritizations by various technology-driven businesses. Any company or organization uses different computing systems in various ways and needs to be aware of what is important to protect for correct operation.

**Software vulnerabilities** are exploits in code and bugs such as buffer or stack overflows, input handling flaws, or uncleaned memory locations. These vulnerabilities can be exploited by an attacker interacting with the executed program in unexpected ways, letting him/her gain access and privileges. For example, a non-sanatized input to a program can accept a massive input that the program has not allocated enough memory for, which would result in a buffer overflow, potentially letting the attacker access parts of the buffer related to system memory or other things he/she is not supposed to have access to.

**Hardware vulnerabilites** are exploits in the physical systems on which software runs such as an insecure chip. This type of vulnerability is usually exploited by having physical access to the target device. For example, the intel Trusted Platform Module is a secure processor on a motherboard to store secret keys, passwords, certificates, etc. This means you can encrypt your entire device and it can only be decrypted with the secret key stored in this secure processor, however a hardware vulnerability is that if you have physical access to the motherboard, you can use a device to read the electrical signals going on the wire leaving the secure TPM chip, and from that you can potentially get the secret key stored there, letting you decrypt and access the computer. There are also some types of hardware vulnerabilities which can be exploited without physical access such as a chip which checks all incoming ethernet signals for a specific pattern before it reaches the rest of a computer.

**Network vulnerabilities** are weaknesses in a network infrastructure, such as misconfigurations or exposed ports. An exposed port which accepts packets from the outside when it doesn't have to, could have vulnerable software running, leading to exploitation by an attacker. A server misconfiguration could mean that certain files or resources are accessible on a server without proper authentication or authorization.

It is often overlooked, but most cyberattacks occur due to the **human element**, which is considered a type of exploitable vulnerability. Insider threats is the name for employees or otherwise individuals who have access to a company's systems legitimately, however they decide to commit or assist in a cyber-attack against the company. The more common human element vulnerability is social engineering such as scams or phishing. This is where attackers attempt to trick humans with access to systems, into giving this access to the attackers. This could be done by a phishing email which downloads and executes malware on the target's computer, compromising the company network, but it can also mean pretending to be someone who should be walking into a secure building and convincing an employee to hold the door for them.

## 4. The Impact of Vulnerabilites in Technology Companies:

Since there are so many types of vulnerabilities and the results can be catastrophic for companies, these vulnerabilites need to be protected against. The impact of an exploited vulnerability could be the result where ransomware encrypts all the companies systems, rendering the company without any of its data and not being able to operate any business going forward.

This is where the importance of preventing vulenrabilites comes in, for which there are several methods to be used in tandem. Firstly and maybe most importantly, patch management is crucial. A software vulnerability can be patched so if a company is using any vulnerable software, it should be updated to newer versions in which the vulnerabilites have been patched. This patch management works in tandem with tracking known vulnerabilities and CVEs related to software the company is using, so that the security team of the company can awalys be aware of what can be a risk.

Another valuable way to prevent vulnerabilities is by penetration testing. This is where a company hires a penetration testing team (or employs them internally), and the pen testers try to find exploitable vulnerabilites with permission. Then they can inform the company what they found and these vulnerabilites can be patched. A company can also pay for security audits which check if the security policies and systems are up to standards.

## Conclusion

Vulnerabilites are the central topic of cybersecurity and I went over them, a bit of their history, their types, and their impact on companies in this blog.

Come back next time for a blog post about specific methods for detecting and mitigating vulnerabilities :)
