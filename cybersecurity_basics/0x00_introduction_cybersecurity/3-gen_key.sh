#!/bin/bash
ssh-keygen -b 4096 -f ./"$1"  -N test -t rsa
