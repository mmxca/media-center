FROM alpine:latest

COPY ./default.template /etc/nginx/conf.d/default.template
COPY ./nginx.sh /usr/bin/nginx.sh

RUN  apk add nginx gettext py3-pip \
  # Temporary 
  && apk add gcc musl-dev python3-dev libffi-dev \
  # Workaround start - https://github.com/pyca/cryptography/issues/4264
  && apk del libressl-dev \
  && apk add openssl-dev \
  && pip install cryptography==2.7 \ 
#==2.2.2  
  && apk del openssl-dev \
  && apk add libressl-dev \
  # Workaround end
  && chmod 755 /usr/bin/nginx.sh \
  && pip install certbot-dns-nsone \
  # Undo Temporary 
  && apk del gcc musl-dev python3-dev libffi-dev \
  && rm -vrf /var/cache/apk/*

EXPOSE 65456/tcp
EXPOSE 443/tcp

CMD /usr/bin/nginx.sh
