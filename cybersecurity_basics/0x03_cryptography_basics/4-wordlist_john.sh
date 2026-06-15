#!/bin/bash
john --wordlist=/usr/share/wordlists/rockyou.txt "$1" --format=Raw-MD5
john --show "$1" --format=Raw-MD5 | awk -F: '{print $NF}' > 4-password.txt
