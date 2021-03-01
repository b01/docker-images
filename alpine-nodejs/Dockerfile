FROM frolvlad/alpine-glibc

ENV VERSION 'v15.10.0'
ENV DISTRO 'linux-x64'

RUN apk --no-progress --purge --no-cache upgrade \
 && apk --no-progress --purge --no-cache add --upgrade \
    bash \
    curl \
    wget \
    gnupg \
    libgcc \
    libstdc++ \
    openssh \
 && apk --no-progress --purge --no-cache upgrade \
 && rm -vrf /var/cache/apk/*

# Install vanilla GLibC: https://github.com/sgerrand/alpine-pkg-glibc
ENV LANG 'C.UTF-8'
ENV GLIB_VER '2.32-r0'

RUN curl -o /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
 && curl -LO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-${GLIB_VER}.apk \
 && curl -LO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-bin-${GLIB_VER}.apk \
 && curl -LO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-i18n-${GLIB_VER}.apk \
 && apk add glibc-${GLIB_VER}.apk \
    glibc-bin-${GLIB_VER}.apk \
    glibc-i18n-${GLIB_VER}.apk \
 && rm /etc/apk/keys/sgerrand.rsa.pub \
 && /usr/glibc-compat/bin/localedef --force --inputfile POSIX --charmap UTF-8 "${LANG}" || true \
 && echo "export LANG=${LANG}" > /etc/profile.d/locale.sh \
 && apk del glibc-i18n \
 && rm glibc-${GLIB_VER}.apk \
    glibc-bin-${GLIB_VER}.apk \
    glibc-i18n-${GLIB_VER}.apk

# Install NodeJS from binary.
RUN wget https://nodejs.org/download/release/${VERSION}/node-${VERSION}-${DISTRO}.tar.xz \
 && mkdir -p /usr/local/lib/nodejs \
 && tar -xJvf node-$VERSION-$DISTRO.tar.xz -C /usr/local/lib/nodejs \
 && rm node-${VERSION}-${DISTRO}.tar.xz

ENV PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH

RUN nodeVer=$(node -v) && echo "node version: ${nodeVer}" \
 && npm version \
 && npx -v

ENTRYPOINT [ "node" ]

# To test run: docker run -t khalifahks/alpine-node -v
