# Identify CWEs

Code snippet:

```
import sqlite3 
def get_user(username): 
    conn = sqlite3.connect('users.db') 
    cursor = conn.cursor() 
    query = "SELECT * FROM users WHERE username='" + username + "';" 
    cursor.execute(query) 
    user = cursor.fetchone() 
    conn.close() 
    return user
```

In the code snippet there is a textbook case of CWE-89 SQL Injection type of vulnerability. The query string is built by concatenating the user input `username` directly into the SQL statement. This means the user can input something such as `' OR '1'='1'--` as the `username`, making the query return all users or other commands to get even more information from the database such as potentially password hashes. Another CWE that is relevant is CWE-20 Improper Input Validation as the `username` input is not validated or sanitized at all which is directly leading to the SQL injection vulnerability.

Mitigation:

```
import re
import sqlite3
def get_user(username):
    if not re.match(r'^[a-zA-Z0-9_]{3,20}$', username):
        raise ValueError("Invalid username format")
    
    conn = sqlite3.connect('users.db')
    cursor = conn.cursor()
    query = "SELECT * FROM users WHERE username = ?;"
    cursor.execute(query, (username,))
    user = cursor.fetchone()
    conn.close()
    return user
```

This version of the code snippet does input validation and parametrization, fixing CWE-20 and CWE-89 vulnerabilities respectively.
