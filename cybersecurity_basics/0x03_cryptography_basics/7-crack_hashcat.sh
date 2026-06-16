#!/bin/bash
hashcat -m 0 "$1" /usr/share/wordlists/rockyou.txt -o 7-password.txt
