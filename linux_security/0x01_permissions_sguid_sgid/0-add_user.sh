#!/bin/bash
useradd -m $1
passwd $1; echo $2
