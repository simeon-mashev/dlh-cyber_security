#!/bin/bash
SALT=$(openssl rand -base64 16)
echo -n "$1$SALT" | openssl sha512 > 3_hash.txt
