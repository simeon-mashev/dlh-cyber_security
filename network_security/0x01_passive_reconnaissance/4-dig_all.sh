#!/bin/bash
dig "$1" A +noall +answer && dig "$1" MX +noall +answer && dig "$1" NS +noall +answer && dig "$1" TXT +noall +answer
