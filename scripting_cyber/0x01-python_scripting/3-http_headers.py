#!/usr/bin/env python3
import sys
import requests

def get_http_headers(url):
    try:
        page = requests.get(url)
        output = {'status_code': page.status_code, 'headers': dict(page.headers) }
        return output
    except requests.exceptions.RequestException:
        return None



if __name__ == "__main__":
    pass


