#!/bin/bash
ps aux | grep '^root' | grep -vE '^\S+\s+\S+\s+\S+\s+\S+\s+0\s+0\s'
