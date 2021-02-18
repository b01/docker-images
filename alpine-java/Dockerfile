FROM alpine:3.13

RUN apk --no-progress --purge --no-cache upgrade \
 && apk --no-progress --purge --no-cache add --upgrade \
    curl \
    wget \
    gnupg \
    libgcc \
    libstdc++ \
    openssh \
 && apk --no-progress --purge --no-cache upgrade \
 && rm -vrf /var/cache/apk/* \
 && curl --version

# Install vanilla GLibC: https://github.com/sgerrand/alpine-pkg-glibc
RUN curl -o /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
 && curl -LO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk \
 && apk add glibc-2.32-r0.apk

RUN wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz \
  && tar xvf jdk-8u131-linux-x64.tar.gz -C /opt \
  && rm jdk-8u131-linux-x64.tar.gz \
  && ln -s /opt/jdk1.8.0_131 /opt/jdk

ENV JAVA_HOME /opt/jdk
ENV PATH $PATH:/opt/jdk/bin

RUN echo $JAVA_HOME && \
    echo $PATH

RUN which java
RUN java -version

ENTRYPOINT [ "java" ]

# To test run: docker run -itd --entrypoint=sh khalifahks/alpine-java
