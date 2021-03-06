FROM khalifahks/alpine-apps

# Add custom support files.
COPY custom-nginx.conf /etc/nginx/
COPY generate-self-signed-cert.sh /usr/local/bin/generate-self-signed-cert.sh
COPY generate-named-ssl-cert.sh /usr/local/bin/generate-named-ssl-cert.sh
COPY start-servers.sh /usr/local/bin/start-servers.sh
COPY watch-servers.sh /usr/local/bin/watch-servers.sh
COPY ./php-fpm.conf /etc/php7/php-fpm.conf

# Install some dependencies.
RUN apk --progress --purge --no-cache upgrade \
 && apk --no-progress --purge --no-cache add --upgrade \
    openssl \
    nginx \
 && mkdir -p /etc/nginx/conf-docker.d && chown root:root /etc/nginx/conf-docker.d \
 && chmod +x /usr/local/bin/generate-self-signed-cert.sh \
 && chmod +x /usr/local/bin/generate-named-ssl-cert.sh \
 && chmod +x /usr/local/bin/start-servers.sh \
 && generate-self-signed-cert.sh \
 && nginx -v \
 && apk --progress --purge --no-cache upgrade \
 && rm -vrf /var/cache/apk/*

# && ln -sf /dev/stdout /var/log/nginx/access.log \
# && ln -sf /dev/stderr /var/log/nginx/error.log \
# && ln -sf /dev/stderr /var/log/fpm-php.www.log \
# && ln -sf /dev/stderr /usr/local/var/log/php-fpm.log \
# && ln -sf /dev/stderr /var/log/xvfb1.log \

# docker build --rm --no-cache -t khalifahks/alpine-cci alpine-cci
# docker run -it --rm --name alpine-cci -h alpine_cci khalifahks/alpine-cci
# docker exec -it alpine-cci sh

ENTRYPOINT []
CMD ["start-servers.sh"]