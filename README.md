# Certbot DDNS Challenge with Dynu

## Overview
Short of owning and managing your own PKI infrastructure, you will run into siutuations where self-signed certificates are not supportted by an application. Signing up for a free ddns domain and using certbot to create a valid certificate is a useful approach. This method leverages the challenge types described here https://letsencrypt.org/docs/challenge-types/. 

## DNS-01 Challenge
The **create_dns_record** script will create a TXT challenge record and output the record ID to a file named dns_record_id.txt in /tmp. **Delete_dns_record.sh** will lookup the record ID in the txt file and request to remove the challenge domain from the API. Certbot will use this method to validate the domain is legitimitely owned and create the certificate. 

## HTTP-01 Challenge
The **create_certbot_cert_http** script initiates the ACME challenge that attemps to place a file on the webroot of your web server that contains key material. Let's Encrypt then tries to retrieve the file from your web server over the internet. Let's Encrypt will validate the responses from the web server and issue the certificate if successful. 

## Requirements
1. Dnyu account or other free ddns
2. Dynu domain (free)
3. Dnyu api key (for dns challenge)
4. Linux host with certbot installed
5. The domain must be 30 days or older to create TXT records
6. Choose http challenge for faster results

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
OR
sh create_certbot_cert_http.sh
```

4. You can adjust the sleep timer in the creation script as needed. 
