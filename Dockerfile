FROM alpine:latest

MAINTAINER Sean Kilgarriff <seanpkilgarriff@gmail.com>

#Install Nginx and remove the cache because we won't be installing it twice.
RUN apk add --update nginx && rm -rf /var/cache/apk/*

#Add custom nginx config file.
COPY ./nginx.conf /etc/nginx/nginx.conf

#Add default config for 1 server.
COPY ./default.conf /etc/nginx/conf.d/default.conf

USER nginxuser

CMD ["nginx", "-g", "daemon off;"]
