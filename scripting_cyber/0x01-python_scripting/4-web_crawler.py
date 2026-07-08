#!/usr/bin/env python3
import sys
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin, urlparse

def crawl_website(start_url, max_depth=2):
    page = requests.get(start_url)
    soup = BeautifulSoup(page.text, "html.parser")
    parsed_start = urlparse(start_url)
    start_domain = parsed_start.netloc
    results = set()

    for i in range(max_depth):
        for link in soup.find_all("a", href=True):
            absolute_url = urljoin(start_url, link["href"])
            parsed = urlparse(absolute_url)
            domain = parsed.netloc
            if (domain == start_domain):
                results.add(absolute_url)
            if (max_depth - i > 1):
                crawl_website(absolute_url, max_depth-(i+1))
    return results



if __name__ == "__main__":
    pass


