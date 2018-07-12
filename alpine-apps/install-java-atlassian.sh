#!/bin/sh -e
# Reference:
#  https://developer.atlassian.com/blog/2015/08/minimal-java-docker-containers/
#  https://wiki.alpinelinux.org/wiki/Running_glibc_programs

# Install cURL
apk add --no-cache --update curl ca-certificates tar
curl -OLs https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk
apk add --allow-untrusted /tmp/glibc-2.21-r2.apk
wget http://www.archlinux.org/packages/core/i686/glibc/download/ -O glibc.pkg.tar.xz
# Download and unarchive Java
mkdir /opt

curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz | tar -xzf - -C /opt

ln -s /opt/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} /opt/jdk

rm -rf /opt/jdk/*src.zip \
       /opt/jdk/lib/missioncontrol \
       /opt/jdk/lib/visualvm \
       /opt/jdk/lib/*javafx* \
       /opt/jdk/jre/lib/plugin.jar \
       /opt/jdk/jre/lib/ext/jfxrt.jar \
       /opt/jdk/jre/bin/javaws \
       /opt/jdk/jre/lib/javaws.jar \
       /opt/jdk/jre/lib/desktop \
       /opt/jdk/jre/plugin \
       /opt/jdk/jre/lib/deploy* \
       /opt/jdk/jre/lib/*javafx* \
       /opt/jdk/jre/lib/*jfx* \
       /opt/jdk/jre/lib/amd64/libdecora_sse.so \
       /opt/jdk/jre/lib/amd64/libprism_*.so \
       /opt/jdk/jre/lib/amd64/libfxplugins.so \
       /opt/jdk/jre/lib/amd64/libglass.so \
       /opt/jdk/jre/lib/amd64/libgstreamer-lite.so \
       /opt/jdk/jre/lib/amd64/libjavafx*.so \
       /opt/jdk/jre/lib/amd64/libjfx*.so