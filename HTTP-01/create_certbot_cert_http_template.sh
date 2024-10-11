sudo certbot certonly --webroot \
    -w /var/www/html \
    -d {domain} \
    --agree-tos --non-interactive --email {email}
