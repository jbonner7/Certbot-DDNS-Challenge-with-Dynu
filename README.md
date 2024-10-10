# Certbot DDNS Challenge with Dynu

## Overview
Short of owning and managing your own PKI infrastructure, you will run into siutuations where self-signed certificates are not supportted by an application. Signing up for a free ddns domain and using certbot to create a valid certificate is a useful approach. This method leverages the challenge types described here https://letsencrypt.org/docs/challenge-types/. 

The **create_dns_record** script will create a TXT challenge record and output the record ID to a file named dns_record_id.txt in /tmp. **Delete_dns_record.sh** will lookup the record ID in the txt file and request to remove the challenge domain from the API. Certbot will use this method to validate the domain is legitimitely owned and create the certificate. 

## Requirements
1. Dnyu account or other free ddns
2. Dynu domain (free)
3. Dnyu api key
4. Linux host with certbot installed
5. The domain must be 30 days or older to create TXT records

## Deployment
1. Validate the scripts separately by running the following commands

```
sh create_dns_record.sh
sh delete_dns_record.sh
```
2. You should see a 200 OK response from the api after each script runs. 
3. Run the certbot generation script:

```
sh create_certbot_cert.sh
```

4. You can adjust the sleep timer in the creation script as needed. 
