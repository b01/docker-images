FROM khalifahks/alpine-php

# Refences:
# https://hub.docker.com/_/php/
# https://wiki.alpinelinux.org/wiki/Installing_Oracle_Java
# https://developer.atlassian.com/blog/2015/08/minimal-java-docker-containers/

# These links helped a lot:
# http://ithubinfo.blogspot.com/2013/11/how-to-install-and-configure-xvfb-in.html
# https://linuxmeerkat.wordpress.com/2014/10/17/running-a-gui-application-in-a-docker-container/amp/
# Xvfb
#   https://blog.bj13.us/2016/06/11/install-a-headless-selenium-server-in-an-alpine-linux-container.html
# Firefox
#   https://developer.mozilla.org/en-US/docs/Mozilla/Firefox/Headless_mode
# Chrome
#   Use to test if chrome is working
#   chromium-browser --no-sandbox --headless --disable-gpu --dump-dom https://www.chromestatus.com/
#   chromium-browser --no-sandbox --headless --disable-gpu --print-to-pdf https://www.chromestatus.com/
#   See more examples here: https://developers.google.com/web/updates/2017/04/headless-chrome

COPY rebased-check.sh /usr/local/bin/
COPY xdebug.ini /etc/php7/conf.d/
COPY add-hosts.sh /usr/local/bin/
COPY start.sh /usr/local/bin/

# Update system
# Install Applications
# The integration test require Selenium, which requires Java
# Install browser drivers.
RUN apk --progress --purge --no-cache upgrade \
 && apk --no-progress --purge --no-cache add --upgrade \
    bash \
    curl \
    dbus-x11 \
    git \
    nodejs \
    nodejs-npm \
    openjdk8 \
    openssh \
    tar \
    xvfb \
    yarn \
 && echo "export CLICOLOR=1" >> /root/.bashrc \
 && echo 'export GREP_OPTIONS="--color=auto --exclude-dir=.git --exclude-dir=.idea"' >> /root/.bashrc \
 && chmod a+x /usr/local/bin/rebased-check.sh \
 && chmod a+x /usr/local/bin/add-hosts.sh \
 && chmod a+x /usr/local/bin/start.sh \
 && mkdir -p /code \
 && chown root:root /code

# Install Firefox and its driver.
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && apk --progress --purge --no-cache upgrade \
 && apk --no-progress --purge --no-cache add --upgrade \
 firefox \
 && curl -kLO https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-linux64.tar.gz \
 && tar -xvzf geckodriver-v0.20.1-linux64.tar.gz \
 && mv geckodriver /usr/local/bin \
 && chmod a+x /usr/local/bin/geckodriver

# Install Chrome and its driver.
#RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
# && apk --progress --purge --no-cache upgrade \
# && apk --no-progress --purge --no-cache add --upgrade \
# chromium \
# && curl -kLO https://chromedriver.storage.googleapis.com/2.38/chromedriver_linux64.zip \
# && unzip chromedriver_linux64.zip \
# && mv chromedriver /usr/local/bin \
# && chmod a+x /usr/local/bin/chromedriver

RUN echo "Intalling extra PHP extensions:" \
 && echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && apk --progress --purge upgrade \
 && apk --no-progress --purge add --no-cache \
 php7-ctype \
 php7-dom \
 php7-gd \
 php7-memcached \
 php7-mongodb \
 php7-soap \
 php7-tokenizer \
 php7-xdebug \
 php7-xml

WORKDIR /code

# docker build --rm --no-cache -t khalifahks/alpine-apps ./alpine-apps
# docker run --entrypoint=sh -it --rm --entrypoint sh khalifahks/alpine-apps

# WIll inherit the entrypoint and cmd options from image it extends.