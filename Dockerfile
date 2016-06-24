FROM nginx:1.10.1
MAINTAINER Mark Shust <mark@shust.com>

COPY lib/nginx.conf /etc/nginx/nginx.conf

ONBUILD RUN openssl dhparam -out /dhparams.pem 2048
