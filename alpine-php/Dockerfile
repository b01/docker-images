FROM alpine:edge

# References:
# https://github.com/docker-library/docs/blob/master/php/README.md

# Install the PHP extensions.
# Downloand PHP composer.
RUN apk --progress --purge --no-cache upgrade \
 && apk --no-progress --purge --no-cache add --upgrade \
    php7 \
    php7-cgi \
    php7-curl \
    php7-fpm \
    php7-iconv \
    php7-json \
    php7-openssl \
    php7-pear \
    php7-phar \
    php7-session \
    php7-xml \
 && apk add --no-cache --virtual dockerRunDeps curl \
 && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
 && apk del dockerRunDeps \
 && apk --progress --purge --no-cache upgrade \
 && rm -rf /var/cache/apk/*

COPY ./php.ini /etc/php7/php.ini
COPY ./php-fpm.conf /etc/php7/php-fpm.conf
COPY ./www.conf /etc/php7/php-fpm.d/www.conf

# docker build --rm --no-cache -t khalifahks/alpine-php ./alpine-php
# docker run -it --rm --name alpine-php -h alpine_php khalifahks/alpine-php
# docker exec -it alpine-php sh

ENTRYPOINT ["php-fpm7"]
CMD ["-c", "/etc/php7/php-fpm.conf"]