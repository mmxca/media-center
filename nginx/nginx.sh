#!/bin/sh
  envsubst "`env | awk -F = '{printf \" \\\\$%s\", $1}'`" < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf && \

  echo "# NS1 API credentials used by Certbot" > /etc/.ns1creds && \
  echo "dns_nsone_api_key = $LETS_ENCRYPT_API_KEY" >> /etc/.ns1creds && \
  chmod 600 /etc/.ns1creds \

  certbot certonly --dns-nsone --dns-nsone-credentials /etc/.ns1creds --dns-nsone-propagation-seconds 60 -d $NGINX_FQDN -m $NGINX_ADMIN_EMAIL --agree-tos -n && \

# echo "0 0,12 * * * root python -c 'import random; import time; time.sleep(random.random() * 3600)' && certbot renew -q" | sudo tee -a /etc/crontab > /dev/null

  nginx -g 'daemon off;'
