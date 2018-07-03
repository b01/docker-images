FROM nginx:1.14-alpine

# Install some dependencies.
# Move default configuration out of the way.
RUN apk --update add --no-cache openssl \
 && ls -la /etc/nginx \
 && mv /etc/nginx/nginx.conf /etc/nginx/nginx-conf.original

# Add a custom nginx config
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./fastcgi_params /etc/nginx/fastcgi_params
COPY ./generate-self-signed-cert.sh /bin/generate-self-signed-cert.sh
COPY ./generate-named-ssl-cert.sh /bin/generate-named-ssl-cert.sh

RUN chmod a+x /bin/generate-self-signed-cert.sh \
 && chmod a+x /bin/generate-named-ssl-cert.sh \
 && ls -la /bin \
 && generate-self-signed-cert.sh \
 && mkdir -p /etc/nginx/conf-docker.d && chown root:root /etc/nginx/conf-docker.d

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
 && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80
EXPOSE 443

# docker build --rm -t khalifahks/alpine-nginx ./alpine-nginx
# docker build --rm --no-cache -t khalifahks/alpine-nginx ./alpine-nginx
# docker run -d --rm -p 80:80 -p 443:443 --label production_status=alpine-nginx --log-opt mode=non-blocking --name alpine-nginx -h alpine_nginx khalifahks/alpine-nginx
# docker run -it --rm -p 80:80 -p 443:443 --label production_status=alpine-nginx --log-opt mode=non-blocking --name alpine-nginx -h alpine_nginx khalifahks/alpine-nginx
# docker exec -it alpine-nginx bash

ENTRYPOINT ["nginx"]
