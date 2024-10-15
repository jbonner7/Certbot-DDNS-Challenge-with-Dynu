sudo certbot certonly --webroot \
    -w /var/www/html \
    -d {domain} \
    --key-type rsa \
    --agree-tos --non-interactive --email {email}
