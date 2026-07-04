#!/bin/bash
dig +noall +answer "$1" A NS SOA MX TXT
