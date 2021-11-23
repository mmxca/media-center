FROM alpine:latest

COPY ./default.template /etc/nginx/conf.d/default.template
COPY ./nginx.sh /usr/bin/nginx.sh

RUN  apk add --no-cache nginx gettext py3-pip \
  && pip install --upgrade pip \
  && chmod 755 /usr/bin/nginx.sh

RUN  apk add --no-cache gcc python3-dev musl-dev openssl-dev libffi-dev rust cargo \
  && pip install certbot-dns-nsone

EXPOSE 65456/tcp
EXPOSE 443/tcp

CMD /usr/bin/nginx.sh
