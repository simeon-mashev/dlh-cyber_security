#!/bin/bash
dig "$1" -t ANY +noall +answer
