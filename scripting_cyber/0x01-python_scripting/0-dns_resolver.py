#!/usr/bin/env python3
import sys
import socket

def resolve_domain_to_ipv4(domain):
    try:
        return socket.gethostbyname(domain)
    except socket.gaierror:
        return None

if __name__ == "__main__":
    pass
