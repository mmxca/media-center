FROM alpine:latest

RUN apk add nginx gettext certbot

COPY ./default.template /etc/nginx/conf.d/default.template
COPY ./nginx.sh /usr/bin/nginx.sh

EXPOSE 65456/tcp

CMD sh -c "envsubst \"`env | awk -F = '{printf \" \\\\$%s\", $1}'`\" < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
