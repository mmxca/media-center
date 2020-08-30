#!/bin/sh
envsubst "`env | awk -F = '{printf \" \\\\$%s\", $1}'`" < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf && \

echo "# NS1 API credentials used by Certbot" > /etc/.ns1creds && \
echo "dns_nsone_api_key = $LETS_ENCRYPT_API_KEY" >> /etc/.ns1creds && \
chmod 600 /etc/.ns1creds && \

#certbot certonly --nginx --dns-nsone --dns-nsone-credentials /etc/.ns1creds --dns-nsone-propagation-seconds 60 -d mom.mmxca.com -m david@mmxca.com --accept && \

nginx -g 'daemon off;'
