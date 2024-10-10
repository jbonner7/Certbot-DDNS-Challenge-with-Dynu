#!/bin/bash

# Create DNS record
# Example for Dynu API, adjust as needed
nodeName="_acme-challenge.$DOMAIN"
DYN_DOMAIN="{DYN_DOMAIN}"
DYN_API_KEY="<API_KEY"

# Extract the record ID from the API response
RECORD_ID=$(curl -s -v -X POST https://api.dynu.com/v2/dns/{dns_record_id}/record \
        -H "accept: application/json" \
        -H "API-Key: $DYN_API_KEY" \
        -H "Content-Type: application/json" \
        -d "{
            \"nodeName\":\"_acme-challenge\",
            \"recordType\":\"TXT\",
            \"ttl\":300,
            \"state\":true,
            \"group\":\"\",
            \"ipv4Address\":\"}"{ipv4Address}\"
        }" | jq -r '.id')

if [ -n "$RECORD_ID" ]; then
  echo "$RECORD_ID" > /tmp/dns_record_id.txt
else
  echo "Failed to create DNS record."
  exit 1
fi

# Wait for DNS propagation
#sleep 60 # Wait for 1 minutes

# After the sleep, the script will exit, and Certbot will continue.
