#!/bin/bash
subfinder -d "$1" -silent -active -oI | awk -F, '{print $1","$2}' > "$1.txt" && subfinder -d "$1" -silent
