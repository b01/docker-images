FROM khalifahks/alpine-php
# Refences:
# https://hub.docker.com/_/php/
# https://wiki.alpinelinux.org/wiki/Installing_Oracle_Java
# https://developer.atlassian.com/blog/2015/08/minimal-java-docker-containers/

# These links helped a lot:
# http://ithubinfo.blogspot.com/2013/11/how-to-install-and-configure-xvfb-in.html
# https://linuxmeerkat.wordpress.com/2014/10/17/running-a-gui-application-in-a-docker-container/amp/

COPY install-java.sh .
COPY ./rebased-check.sh /bin/rebased-check.sh

# Install Applications
# The integration test require Selenium, which requires Java
# Install browser drivers.
RUN apk add --no-cache --update \
    paxctl \
    tar \
    chromium \
    dbus-x11 \
    git \
    nodejs \
    nodejs-npm \
    xvfb \
    yarn \
 && echo "export CLICOLOR=1" >> /root/.bashrc \
 && echo 'export GREP_OPTIONS="--color=auto --exclude-dir=.git --exclude-dir=.idea"' >> /root/.bashrc \
 && chmod a+x /bin/rebased-check.sh \
 && mkdir -p /code \
 && chown root:root /code \
 && chmod +x ./install-java.sh \
 && ./install-java.sh \
 && wget https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-linux64.tar.gz \
 && tar -xvzf geckodriver-v0.20.1-linux64.tar.gz \
 && mv geckodriver /usr/local/bin \
 && wget https://chromedriver.storage.googleapis.com/2.38/chromedriver_linux64.zip \
 && unzip chromedriver_linux64.zip \
 && mv chromedriver /usr/local/bin

ENV JAVA_HOME /opt/java/current
ENV PATH ${PATH}:${JAVA_HOME}/bin

WORKDIR /code

# use to test if chrome is working
# chromium-browser --no-sandbox --headless --disable-gpu --dump-dom https://www.chromestatus.com/
# chromium-browser --no-sandbox --headless --disable-gpu --print-to-pdf https://www.chromestatus.com/

# see here for more examples: https://developers.google.com/web/updates/2017/04/headless-chrome

# docker build --rm --no-cache -t khalifahks/alpine-apps ./alpine-apps
# docker run -d --rm --name alpine-apps khalifahks/alpine-apps
# docker exec -it alpine-apps sh

ENTRYPOINT ["php-fpm"]
CMD ["-c", "/usr/local/etc/php/php-fpm.conf"]