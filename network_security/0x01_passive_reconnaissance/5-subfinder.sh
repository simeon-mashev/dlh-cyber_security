#!/bin/bash
subfinder -d $1 -silent && subfinder -d $1 -silent -nW -oI | awk -F, '{print $1","$2}' > "$1.txt"
