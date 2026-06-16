#!/bin/bash
john --wordlist=/usr/share/wordlists/rockyou.txt "$1" --format=NT > /dev/null 2>&1 && john --show "$1" --format=NT | awk -F: '{print $NF}' | head -1 > 5-password.txt
