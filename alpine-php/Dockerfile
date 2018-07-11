FROM php:7.2-fpm-alpine3.7

# References:
# https://github.com/docker-library/docs/blob/master/php/README.md

# Install the PHP extensions.
# Downloand PHP composer.
RUN apk add --no-cache --update libmemcached \
 && apk add --no-cache --update --virtual peclDeps autoconf g++ libmemcached-dev make zlib-dev \
 && pecl install xdebug-2.6.0 \
 && pecl install memcached-3.0.4 \
 && docker-php-ext-enable memcached xdebug \
 && apk del peclDeps \
 && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Use custom PHP configs.
COPY ./php.ini /usr/local/etc/php/php.ini
COPY ./php-fpm.conf /usr/local/etc/php-fpm.conf
COPY ./www.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

# docker build --rm --no-cache -t khalifahks/alpine-php ./alpine-php
# docker run -d --rm --name alpine-php -h alpine_php khalifahks/alpine-php
# docker exec -it alpine-php sh

ENTRYPOINT ["php-fpm"]
CMD ["-c", "/usr/local/etc/php/php-fpm.conf"]