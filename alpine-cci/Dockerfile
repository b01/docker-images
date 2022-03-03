FROM khalifahks/alpine-glibc:2.34-r0

# Install some dependencies.
RUN apk --progress --purge --no-cache upgrade \
 && apk --no-progress --purge --no-cache add --upgrade \
    bash \
    git \
    tar \
    unzip \
    openssh \
    wget \
    zip \
 && apk --progress --purge --no-cache upgrade \
 && rm -vrf /var/cache/apk/*

RUN curl -LO https://github.com/cli/cli/releases/download/v2.5.2/gh_2.5.2_linux_amd64.tar.gz \
 && tar -xzvf ./gh_2.5.2_linux_amd64.tar.gz \
 && mv gh_2.5.2_linux_amd64/bin/gh /usr/local/bin \
 && rm -rf gh_2.5.2_linux_amd64 \
    gh_2.5.2_linux_amd64.tar.gz

COPY start.sh /usr/local/bin

RUN chmod +x /usr/local/bin/start.sh

SHELL [ "bash" ]

ENTRYPOINT [ ]
CMD [ ]
