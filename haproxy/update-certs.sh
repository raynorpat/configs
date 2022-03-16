#!/usr/bin/env bash

# Renew the certificate
certbot renew --force-renewal

# Concatenate new cert files, with less output (avoiding the use tee and its output to stdout)
bash -c "cat /etc/letsencrypt/live/raynorpat.com/fullchain.pem /etc/letsencrypt/live/raynorpat.com/privkey.pem > /etc/haproxy/raynorpat.com.pem"
bash -c "cat /etc/letsencrypt/live/flamingent.com/fullchain.pem /etc/letsencrypt/live/flamingent.com/privkey.pem > /etc/haproxy/flamingent.com.pem"

# Reload  HAProxy
service haproxy reload
