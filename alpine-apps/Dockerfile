FROM khalifahks/alpine-php

# Refences:
# https://hub.docker.com/_/php/
# https://wiki.alpinelinux.org/wiki/Installing_Oracle_Java
# https://developer.atlassian.com/blog/2015/08/minimal-java-docker-containers/

# These links helped a lot:
# http://ithubinfo.blogspot.com/2013/11/how-to-install-and-configure-xvfb-in.html
# https://linuxmeerkat.wordpress.com/2014/10/17/running-a-gui-application-in-a-docker-container/amp/

# Use to test if chrome is working
# chromium-browser --no-sandbox --headless --disable-gpu --dump-dom https://www.chromestatus.com/
# chromium-browser --no-sandbox --headless --disable-gpu --print-to-pdf https://www.chromestatus.com/
# See more examples here: https://developers.google.com/web/updates/2017/04/headless-chrome

COPY rebased-check.sh /usr/local/bin/
COPY xdebug.ini /etc/php7/conf.d/

# Install Applications
# The integration test require Selenium, which requires Java
# Install browser drivers.
RUN apk --purge add --no-cache \
    tar \
    chromium \
    dbus-x11 \
    git \
    nodejs \
    nodejs-npm \
    openjdk8 \
    openssh \
    xvfb \
    yarn \
 && echo "export CLICOLOR=1" >> /root/.bashrc \
 && echo 'export GREP_OPTIONS="--color=auto --exclude-dir=.git --exclude-dir=.idea"' >> /root/.bashrc \
 && chmod +x /usr/local/bin/rebased-check.sh \
 && mkdir -p /code \
 && chown root:root /code

#RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-linux64.tar.gz \
# && tar -xvzf geckodriver-v0.20.1-linux64.tar.gz \
# && mv geckodriver /usr/local/bin \
# && wget https://chromedriver.storage.googleapis.com/2.38/chromedriver_linux64.zip \
# && unzip chromedriver_linux64.zip \
# && mv chromedriver /usr/local/bin
RUN echo "Intalling extra PHP extensions:" \
 && echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && apk --progress --purge upgrade \
 && apk --no-progress --purge add --no-cache \
 curl \
 libsodium \
 php7-ctype \
 php7-dom \
 php7-gd \
 php7-mbstring \
 php7-memcached \
 php7-pdo \
 php7-simplexml \
 php7-soap \
 php7-tokenizer \
 php7-xdebug \
 php7-xmlreader \
 php7-xmlwriter \
 && apk add --no-cache --virtual peclDeps autoconf g++ libsodium-dev make php7-dev \
 && pear config-set php_ini /etc/php7/php.ini \
 && pecl install mongodb \
 && pecl install libsodium \
 && pecl clear-cache \
 && apk del peclDeps \
 && php -m

RUN echo "NPM install require" \
 && apk add python make g++

WORKDIR /code

# docker build --rm --no-cache -t khalifahks/alpine-apps ./alpine-apps
# docker run -it --rm --name alpine-apps khalifahks/alpine-apps
# docker exec -it alpine-apps sh

ENTRYPOINT ["php-fpm7"]
CMD ["-c", "/etc/php7/php-fpm.conf"]