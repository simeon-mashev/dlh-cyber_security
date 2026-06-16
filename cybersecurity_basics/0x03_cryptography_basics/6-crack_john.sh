#!/bin/bash
john --wordlist=/usr/share/wordlists/rockyou.txt "$1" --format=Raw-SHA256 > /dev/null 2>&1 && john --show "$1" --format=Raw-SHA256 | awk -F: '{print $NF}' | head -1 > 6-password.txt
