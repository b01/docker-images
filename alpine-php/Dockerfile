FROM alpine:edge as base

# References:
# https://github.com/docker-library/docs/blob/master/php/README.md

COPY get-composer.sh ./

# Install the PHP extensions.
# Downloand PHP composer.
RUN chmod +x ./get-composer.sh \
 && apk --progress --purge --no-cache upgrade \
 && apk --no-progress --purge --no-cache add --upgrade \
    bash \
    curl \
    php7 \
    php7-cgi \
    php7-curl \
    php7-fpm \
    php7-iconv \
    php7-json \
    php7-mbstring \
    php7-mcrypt \
    php7-openssl \
    php7-pdo \
    php7-pear \
    php7-phar \
    php7-session \
    php7-sodium \
    php7-tokenizer \
    php7-xmlreader \
    php7-xmlwriter \
 && ./get-composer.sh \
 && apk --progress --purge --no-cache upgrade \
 && rm -vrf /var/cache/apk/* \
 && rm ./get-composer.sh \
 && composer -V \
 && curl http://get.sensiolabs.org/sami.phar -o /usr/local/bin/sami.phar \
 && chmod +x /usr/local/bin/sami.phar \
 && sami.phar -V

RUN addgroup -S phpfpm \
 && adduser -D phpfpmuser \
 && addgroup phpfpmuser phpfpm \
 && addgroup root phpfpm \
 && mkdir -p /var/lib/php7/session \
 && chown phpfpmuser:phpfpm /var/lib/php7/session

COPY php.ini /etc/php7/
COPY php-fpm.conf /etc/php7/
COPY www.conf /etc/php7/php-fpm.d/

# docker build --rm --no-cache -t khalifahks/alpine-php ./alpine-php
# docker build --rm --no-cache -t khalifahks/alpine-php --target=base ./alpine-php
# docker run -it --rm --entrypoint sh khalifahks/alpine-php

ENTRYPOINT ["php-fpm7"]
CMD ["--fpm-config", "/etc/php7/php-fpm.conf", "-c", "/etc/php7/php.ini"]

FROM base as cci

COPY xdebug.ini /etc/php7/conf.d/

RUN apk --no-progress --purge --no-cache add \
    openssh \
    git \
    php7-xdebug