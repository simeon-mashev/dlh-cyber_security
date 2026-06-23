#!/bin/bash
find / -type d -perm -o+w -exec chmod o-w {} \;
