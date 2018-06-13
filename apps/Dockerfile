FROM khalifahks/centos-php

ADD google-chrome.repo /etc/yum.repos.d/google-chrome.repo

RUN yum info google-chrome-stable

# Install yarn RPMs and GPG keys
RUN curl -sS https://dl.yarnpkg.com/rpm/yarn.repo >> /etc/yum.repos.d/yarn.repo \
 && curl -sS https://dl.yarnpkg.com/rpm/pubkey.gpg >> /etc/pki/rpm-gpg/RPM-GPG-KEY-yarn \
 && rpm --import etc/pki/rpm-gpg/RPM-GPG-KEY-yarn \
 && echo "sslverify=false" >> /etc/yum.conf \
 && curl -sSk https://rpm.nodesource.com/pub_9.x/el/7/x86_64/nodesource-release-el7-1.noarch.rpm >> ./nodesource-release-el7-1.noarch.rpm \
 && yum -y install --nogpgcheck ./nodesource-release-el7-1.noarch.rpm

RUN yum -y update \
 && yum -y install git \
    php-pecl-xdebug \
    nodejs \
    yarn \
    firefox \
    java-1.8.0-openjdk \
    make \
    gcc-c++ \
    google-chrome-stable \
    bzip2 \
    xorg-x11-server-Xvfb \
    dbus-x11 \
    unzip \
 && yum clean all \
 && rm -rf /var/cache/yum \
 && mkdir -p code

ADD ./rebased-check.sh /bin/rebased-check.sh

RUN echo "export CLICOLOR=1" >> /root/.bashrc \
 && echo 'export GREP_OPTIONS="--color=auto --exclude-dir=.git --exclude-dir=.idea"' >> /root/.bashrc \
 && chmod a+x /bin/rebased-check.sh

# These links helped a lot:
# http://ithubinfo.blogspot.com/2013/11/how-to-install-and-configure-xvfb-in.html
# https://linuxmeerkat.wordpress.com/2014/10/17/running-a-gui-application-in-a-docker-container/amp/
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-linux64.tar.gz \
 && tar -xvzf geckodriver-v0.20.1-linux64.tar.gz \
 && mv geckodriver /bin \
 && wget https://chromedriver.storage.googleapis.com/2.38/chromedriver_linux64.zip \
 && unzip chromedriver_linux64.zip \
 && mv chromedriver /bin \
 && mkdir /run/dbus \
 && echo "export DISPLAY=:1.0" >> /etc/bashrc

WORKDIR code

# use to test if chrome is working
# google-chrome --no-sandbox --headless --disable-gpu --dump-dom https://www.chromestatus.com/

# use to save a PDF of the page
# chrome --headless --disable-gpu --print-to-pdf https://www.chromestatus.com/

# see here for more examples: https://developers.google.com/web/updates/2017/04/headless-chrome

# docker build --rm -t khalifahks/centos-apps ./apps
# docker run -d --rm --name centos-apps khalifahks/centos-apps
# docker run -it --rm --name centos-apps khalifahks/centos-apps
# docker run --rm --name centos-apps khalifahks/centos-apps
# docker exec -it centos-apps bash

ENTRYPOINT ["php-fpm"]