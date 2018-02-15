FROM khalifahks/centos-php

# Install yarn RPMs and GPG keys
RUN curl -sS https://dl.yarnpkg.com/rpm/yarn.repo >> /etc/yum.repos.d/yarn.repo \
 && curl -sS https://dl.yarnpkg.com/rpm/pubkey.gpg >> /etc/pki/rpm-gpg/RPM-GPG-KEY-yarn \
 && rpm --import etc/pki/rpm-gpg/RPM-GPG-KEY-yarn

RUN yum -y update \
 && yum -y install git \
    php-pecl-xdebug \
    nodejs \
    yarn \
    firefox \
 && yum clean all

RUN cd && mkdir -p apps

WORKDIR apps

RUN php --version && git --version && pwd

# docker build -t khalifahks/centos-apps ./apps
# docker run -d --rm --name centos-apps khalifahks/centos-apps
# docker run -it --rm --name centos-apps khalifahks/centos-apps
# docker exec -it centos-apps bash
ENTRYPOINT ["tail", "-f", "/dev/null"]