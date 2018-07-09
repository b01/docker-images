FROM alpine:edge
# Refences:
# https://github.com/Zenika/alpine-chrome
#
# These links helped a lot:
#   http://ithubinfo.blogspot.com/2013/11/how-to-install-and-configure-xvfb-in.html
#   https://linuxmeerkat.wordpress.com/2014/10/17/running-a-gui-application-in-a-docker-container/amp/
#
# Use to test if chrome is working
#   chromium-browser --no-sandbox --headless --disable-gpu --dump-dom https://www.chromestatus.com/
#   chromium-browser --no-sandbox --headless --disable-gpu --print-to-pdf https://www.chromestatus.com/
#   docker run --rm khalifahks/alpine-chrome --no-sandbox --headless --disable-gpu --print-to-pdf https://www.chromestatus.com/
#
# See here for more examples:
#   https://developers.google.com/web/updates/2017/04/headless-chrome

# Install Applications
# Install browser drivers.
# Add Chrome as a user
RUN apk add --no-cache --update \
    chromium \
    dbus-x11 \
    unzip \
    xvfb \
 && rm -rf /var/lib/apt/lists/* \
    /var/cache/apk/* \
    /usr/share/man \
    /tmp/* \
 && wget https://chromedriver.storage.googleapis.com/2.38/chromedriver_linux64.zip \
 && unzip chromedriver_linux64.zip \
 && mv chromedriver /usr/local/bin \
 && rm chromedriver_linux64.zip \
 && adduser -D chrome
#RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-linux64.tar.gz \
# && tar -xvzf geckodriver-v0.20.1-linux64.tar.gz \
# && mv geckodriver /usr/local/bin \
# && rm geckodriver-v0.20.1-linux64.tar.gz

# Run Chrome non-privileged
USER chrome

ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROME_PATH=/usr/lib/chromium/

# docker build --rm --no-cache -t khalifahks/alpine-chrome ./alpine-chrome
# docker run -d --rm --name alpine-chrome khalifahks/alpine-chrome
# docker exec -it alpine-chrome sh

ENTRYPOINT ["chromium-browser"]
CMD ["--no-sandbox", "--headless", "--disable-gpu", "--disable-software-rasterizer"]