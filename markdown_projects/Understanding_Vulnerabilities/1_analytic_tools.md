# Analytic Tools
A blog post about analytic tools to find and mitigate vulnerabilities

## 1. Introduction to Static and Dynamic Analysis Tools:

There are 2 types of tools to analyse a program for vulnerabilities: static and dynamic. Static analysis occurs before the program runs and attempts to find issues with the code which result in things like buffer overflows, or hardcoded secrets. Dynamic analysis occurs during program execution and attempts to find memory leaks or other issues with the execution of the program itself.

Both static and dynamic analysis tools are essential for security testing. A passive tool cannot account for how a program will run, while an active tool may not see all possibilities and miss a vulnerability because it wasn't "activated" during testing. This is why both need to be used.

### Historical Context:

Static analysis traces back to compiler theory in the 1970s. Early tools could check for syntax and type errors. It's better to spot those kinds of issues before compiling and running the program.

Dynamic analysis also traces back to the 1970s and 1980s. More specifically, emerging from debugging and testing, by checking memory usage during program execution to verify intended operation.


## 2. Types of Analysis Tools Explained:

As I mentioned above there are 2 types of tools - static and dynamic, and both are important for security.

Static analysis can find issues with the code itself and run relatively quickly. You can keep doing static analysis on code to ensure secure coding practices. Most IDEs today will show you code errors such as syntax or type errors without compiling and executing the code. You can then use a security static analysis tool for a more thorough analysis. But there is a limit to how much you can find, and that is where dynamic analysis comes in.

Dynamic analysis cannot tell you if you have an issue with the code, it can tell you if there is an issue with the execution. It works by running the program with various inputs and environments, to verify the program behaviour and outputs against security goals. It will tell you if there is a memory leak or if a certain input causes an atypically large amount of resources being used.

## 3. The Impact of Analysis Tools on Software Security

Static and Dynamic analysis tools are widely used in the software industry and rightfully so. Any software development company not using such tools risks vulnerabilities being found in the software after shipping, resulting in issues for customers and lowering of public image, and consequently sales for the company. There may also be risk of legal liabilities in certain contexts. The 2 types of tools complement each other for a more thorough and complete analysis.

Let's take for example, an imaginary video game development company C-games (short for Cybersecurity games). They release a new update to a live service game without doing any static or dynamic analysis. As a result, critical vulnerabilities are discovered by cyber-criminals who are able to execute malware on any player's PC, stealing their data, passwords, crypto-wallet keys, etc. This could affect many of the regular players of the game and this could potentially make C-games legally liable. Even unaffected players would likely stop playing this game and uninstall it to avoid personal risk, leading to a huge loss in playerbase and revenue for C-games. In this imaginary scenario, C-games releases an update patch on the next day, fixing the vulnerability, but the damage is already done. Now imagine if C-games had done static and dynamic testing, it would require extra man-hours and potentially delay the release of the original update, but it would discover the vulnerability before shipping the update and prevent a disaster for C-games.

## Conclusion

In this blog post I overviewed the differences between static and dynamic analysis tools - the former for analysing code and the latter for analysing the execution of a program. And I also showed how the use of both is vital for modern software development companies.


Come back next time for a look into Injection vulnerabilities :)
