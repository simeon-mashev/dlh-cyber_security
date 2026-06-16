#!/bin/bash
john --wordlist=/usr/share/wordlists/rockyou.txt "$1" --format=NT > 5-password.txt
