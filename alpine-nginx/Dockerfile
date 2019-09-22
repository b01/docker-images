FROM alpine:3.10

# Add a custom nginx config
COPY ./generate-self-signed-cert.sh /bin/
COPY ./generate-named-ssl-cert.sh /bin/

# 1. Quietly upgrade existing packages (no-cache).
# 2. Install packages (no-cache).
# 3. Generate a self-signed cert.
# 4. Direct all NGinX logs to system out.
# 5. Clean-up.
RUN apk -q --progress --purge --no-cache upgrade \
 && apk --no-progress --purge --no-cache add --upgrade \
    curl \
    nginx \
    openssl \
 && chmod a+x /bin/generate-self-signed-cert.sh \
 && chmod a+x /bin/generate-named-ssl-cert.sh \
 && generate-self-signed-cert.sh \
 && ln -sf /dev/stdout /var/log/nginx/access.log \
 && ln -sf /dev/stderr /var/log/nginx/error.log \
 && nginx -v \
 && apk -q --progress --purge --no-cache upgrade \
 && rm -vrf /var/cache/apk/*

COPY ./custom-nginx.conf /etc/nginx/

# docker build --rm --no-cache -t khalifahks/alpine-nginx ./alpine-nginx
# docker run -it --rm --label production_status=alpine-nginx --log-opt mode=non-blocking --name alpine-nginx -h alpine_nginx khalifahks/alpine-nginx
# docker exec -it alpine-nginx sh

ENTRYPOINT ["nginx"]
CMD ["-c", "/etc/nginx/custom-nginx.conf"]
