#!/bin/bash
subfinder -d "$1" -silent -active -oI | tee >(awk -F, '{print $1","$2}' > "$1.txt") | awk -F, '{print $1}'
