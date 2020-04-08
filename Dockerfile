FROM alpine:latest

RUN \
    apk update && apk upgrade \
    && apk add nginx \
    && mkdir -p /run/nginx \
    && mkdir /var/www/html/ \
    && rm /etc/nginx/conf.d/default.conf

COPY default.conf /etc/nginx/conf.d/
COPY index.html /var/www/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]