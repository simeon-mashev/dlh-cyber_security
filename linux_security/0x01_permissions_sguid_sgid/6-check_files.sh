#!/bin/bash
find "$1" -perm /6000 -type f -mtime -1 2>/dev/null
