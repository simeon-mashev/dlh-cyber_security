#!/usr/bin/env python3
import sys
import requests

def get_http_headers(url):
    page = requests.get(url)
    output = {'status_code': page.status_code, 'headers': dict(page.headers) }
    return output



if __name__ == "__main__":
    pass


