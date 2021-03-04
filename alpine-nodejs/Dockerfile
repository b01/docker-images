FROM alpine:3.13

ARG GLIB_VER='2.32-r0'
ARG NODEJS_VER='v15.10.0'
ARG NODEJS_DIST='linux-x64'

ENV LD_LIBRARY_PATH='/usr/lib:/lib'

RUN apk --no-progress --purge --no-cache upgrade \
 && apk --no-progress --purge --no-cache add --upgrade --virtual=build_deps \
    ca-certificates \
    curl \
    libstdc++ \
 && apk --no-progress --purge --no-cache upgrade \
 && rm -vrf /var/cache/apk/*

# Install vanilla GLibC: https://github.com/sgerrand/alpine-pkg-glibc
RUN curl -o /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
 && curl -LO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-${GLIB_VER}.apk \
 && apk add glibc-${GLIB_VER}.apk \
 && rm /etc/apk/keys/sgerrand.rsa.pub \
 && rm glibc-${GLIB_VER}.apk

# Install NodeJS from binary.
RUN curl -LO https://nodejs.org/download/release/${NODEJS_VER}/node-${NODEJS_VER}-${NODEJS_DIST}.tar.xz \
 && mkdir -p /usr/local/lib/nodejs \
 && tar -xJvf node-${NODEJS_VER}-${NODEJS_DIST}.tar.xz -C /usr/local/lib/nodejs \
 && rm node-${NODEJS_VER}-${NODEJS_DIST}.tar.xz

ENV PATH="/usr/local/lib/nodejs/node-${NODEJS_VER}-${NODEJS_DIST}/bin:$PATH"

RUN env && nodeVer=$(node -v) && echo "node version: ${nodeVer}" \
 && npm version \
 && npx -v

ENTRYPOINT [ "node" ]

CMD [ "-v" ]
# To test run: docker run -t khalifahks/alpine-node -v
