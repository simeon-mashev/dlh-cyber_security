#!/usr/bin/env python3
import sys
import dns.resolver

def query_dns_records(domain):
    record_types = ['A', 'AAAA', 'MX', 'NS', 'TXT', 'SOA']
    records = {}
    for rtype in record_types:
        try:
            records[rtype] = dns.resolver.resolve(domain, rtype)
        except (dns.resolver.NoAnswer):
            continue
    return records



if __name__ == "__main__":
    import sys
    domain_name = sys.argv[1]
    results = query_dns_records(domain_name)
    for record_type, response_text in results.items():
        print(f"\n{record_type} Records:")
        print(response_text.response.to_text())
    print("\nResults dictionary:", results)

