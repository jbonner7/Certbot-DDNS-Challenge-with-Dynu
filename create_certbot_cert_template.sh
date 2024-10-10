#!/bin/bash

#Create cert using certbot

sudo certbot certonly --manual \
    --preferred-challenges dns \
    -d {domain} \
    --manual-auth-hook create_dns_record.sh \
    --manual-cleanup-hook delete_dns_record.sh \
    --agree-tos --non-interactive --email {email} \
    --disable-hook-validation