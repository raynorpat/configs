#!/usr/bin/env bash

# Create the certificate and wildcard cert
certbot certonly --dns-cloudflare --dns-cloudflare-credentials ~/.secrets/certbot/cloudflare.ini -d raynornet.xyz,*.raynornet.xyz

# Put together the full certificate for HAProxy
bash -c "cat /etc/letsencrypt/live/raynornet.xyz/fullchain.pem /etc/letsencrypt/live/raynornet.xyz/privkey.pem > /etc/haproxy/raynornet.xyz.pem"

# Reload  HAProxy
service haproxy reload
