#!/usr/bin/env bash

# Renew the certificate
certbot renew --force-renewal

# Concatenate new cert files, with less output (avoiding the use tee and its output to stdout)
bash -c "cat /etc/letsencrypt/live/raynornet.xyz/fullchain.pem /etc/letsencrypt/live/raynornet.xyz/privkey.pem > /etc/haproxy/raynornet.xyz.pem"

# Reload  HAProxy
service haproxy reload
