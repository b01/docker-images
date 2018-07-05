FROM khalifahks/alpine-php
# Refences:
# https://hub.docker.com/_/php/
# https://wiki.alpinelinux.org/wiki/Installing_Oracle_Java
# https://developer.atlassian.com/blog/2015/08/minimal-java-docker-containers/

# May need
# glibc-2.21 \
RUN apk --update add --no-cache \
    ca-certificates \
    curl \
    paxctl \
    php7-memcached \
    php7-xdebug \
    wget \
    tar

COPY install-java.sh .

RUN chmod +x ./install-java.sh \
 && ./install-java.sh

ENV JAVA_HOME /opt/java/current
ENV PATH ${PATH}:${JAVA_HOME}/bin

# Install Applications
# The integration test require Selenium, which requires Java
RUN apk -U --no-cache \
    --allow-untrusted add --update \
    bzip2 \
    chromium \
    dbus-x11 \
    git \
    nodejs \
    nodejs-npm \
    unzip \
    xvfb \
    yarn

COPY ./rebased-check.sh /bin/rebased-check.sh
#COPY ./15-xdebug.ini /etc/php7/conf.d/15-xdebug.ini

RUN echo "export CLICOLOR=1" >> /root/.bashrc \
 && echo 'export GREP_OPTIONS="--color=auto --exclude-dir=.git --exclude-dir=.idea"' >> /root/.bashrc \
 && chmod a+x /bin/rebased-check.sh \
 && mkdir -p /code \
 && chown root:root /code

# Install browser drivers and setup a virtual monitor.
# These links helped a lot:
# http://ithubinfo.blogspot.com/2013/11/how-to-install-and-configure-xvfb-in.html
# https://linuxmeerkat.wordpress.com/2014/10/17/running-a-gui-application-in-a-docker-container/amp/
#RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-linux64.tar.gz \
# && tar -xvzf geckodriver-v0.20.1-linux64.tar.gz \
# && mv geckodriver /bin
#
#RUN wget https://chromedriver.storage.googleapis.com/2.38/chromedriver_linux64.zip \
# && unzip chromedriver_linux64.zip \
# && mv chromedriver /bin \
# && mkdir /run/dbus \
# && echo "export DISPLAY=:1.0" >> /etc/bashrc

WORKDIR /code

# use to test if chrome is working
# chromium-browser --no-sandbox --headless --disable-gpu --dump-dom https://www.chromestatus.com/

# use to save a PDF of the page
# chrome --headless --disable-gpu --print-to-pdf https://www.chromestatus.com/

# see here for more examples: https://developers.google.com/web/updates/2017/04/headless-chrome

# docker build --rm --no-cache -t khalifahks/alpine-apps ./alpine-apps
# docker run -d --rm --name alpine-apps khalifahks/alpine-apps
# docker run -it --rm --name alpine-apps khalifahks/alpine-apps
# docker run --rm --name alpine-apps khalifahks/alpine-apps
# docker exec -it alpine-apps sh

ENTRYPOINT ["php-fpm"]
CMD ["-c", "/etc/php7/php-fpm.conf"]