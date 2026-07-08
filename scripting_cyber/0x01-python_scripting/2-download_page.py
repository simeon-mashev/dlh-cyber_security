#!/usr/bin/env python3
import sys
import requests
from bs4 import BeautifulSoup

def download_page(url):
    page = requests.get(url)
    soup = BeautifulSoup(page.text, "html.parser")
    return soup.prettify()


if __name__ == "__main__":
    pass


