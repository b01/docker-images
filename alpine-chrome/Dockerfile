FROM alpine:3.7
# Refences:
# https://hub.docker.com/_/php/
# https://wiki.alpinelinux.org/wiki/Installing_Oracle_Java
# https://developer.atlassian.com/blog/2015/08/minimal-java-docker-containers/

# Install Applications
# The integration test require Selenium, which requires Java
RUN apk --update --allow-untrusted add --no-cache \
    bzip2 \
    chromium \
    dbus-x11 \
    unzip \
    xvfb \
 && rm -rf /var/lib/apt/lists/* \
    /var/cache/apk/* \
    /usr/share/man \
    /tmp/*

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

# use to test if chrome is working
# chromium-browser --no-sandbox --headless --disable-gpu --dump-dom https://www.chromestatus.com/

# use to save a PDF of the page
# chrome --headless --disable-gpu --print-to-pdf https://www.chromestatus.com/

# see here for more examples: https://developers.google.com/web/updates/2017/04/headless-chrome

# docker build --rm --no-cache -t khalifahks/alpine-chrome ./alpine-chrome
# docker run -d --rm --name alpine-chrome khalifahks/alpine-chrome
# docker run -it --rm --name alpine-chrome khalifahks/alpine-chrome
# docker run --rm --name alpine-chrome khalifahks/alpine-chrome
# docker exec -it alpine-chrome sh

# Add Chrome as a user
RUN adduser -D chrome

# Run Chrome non-privileged
USER chrome

ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROME_PATH=/usr/lib/chromium/

ENTRYPOINT ["chromium-browser"]
CMD ["--headless", "--disable-gpu", "--disable-software-rasterizer"]