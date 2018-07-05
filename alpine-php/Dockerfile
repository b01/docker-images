FROM php:7.2-fpm-alpine3.7

# References:
# https://php.earth/docs/docker/alpine

# Specify which version of PHP to install.
# Install the PHP extensions. Notice the @php is required to avoid getting default php packages from alpine instead.
# To see availabe packages run: apk search --no-cache php7
RUN apk --update add --no-cache \
    php7 \
    php7-curl \
    php7-fpm \
    php7-iconv \
    php7-json \
    php7-openssl \
    php7-phar

# Downloand PHP composer.
# Move the default configuration files out of the way.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer\
 && mv /etc/php7/php.ini /etc/php7/php.txt \
 && mv /etc/php7/php-fpm.conf /etc/php7/php-fpm.txt \
 && mv /etc/php7/php-fpm.d/www.conf /etc/php7/php-fpm.d/www.txt

# Use custom PHP configs.
COPY ./php.ini /etc/php7/php.ini
COPY ./php-fpm.conf /etc/php7/php-fpm.conf

EXPOSE 9000
EXPOSE 10000

# docker build --rm --no-cache -t khalifahks/alpine-php ./alpine-php
# docker build --rm -t khalifahks/alpine-php ./alpine-php
# docker run -d --rm --name alpine-php -h alpine_php khalifahks/alpine-php
# docker run -it --rm --name alpine-php -h alpine_php khalifahks/alpine-php
# docker exec -it alpine-php bash

ENTRYPOINT ["php-fpm"]
CMD ["-c", "/etc/php7/php-fpm.conf"]