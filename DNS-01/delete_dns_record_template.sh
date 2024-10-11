#!/bin/bash

# Delete DNS record
DYN_API_KEY="<API_KEY>"
DYN_DOMAIN="{DYN_DOMAIN}"

# Make an API call to delete the record (you'll need the record ID for this)
RECORD_ID=$(cat /tmp/dns_record_id.txt)

if [ -n "$RECORD_ID" ]; then
  curl -X DELETE https://api.dynu.com/v2/dns/{dns_record_id}/record/$RECORD_ID \
    -H "accept: application/json" \
    -H "API-Key: $DYN_API_KEY"
else
  echo "Record ID not found."
  exit 1
fi