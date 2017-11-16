FROM khalifahks/centos-php

RUN curl -sS https://dl.yarnpkg.com/rpm/yarn.repo >> /etc/yum.repos.d/yarn.repo

RUN yum -y update \
 && yum -y install git \
    php-pecl-xdebug \
    nodejs \
    yarn \
 && yum clean all

RUN cd && mkdir -p apps

WORKDIR apps

RUN php --version && git --version && pwd

# docker build -t khalifahks/centos-apps ./apps
# docker run -d --rm --name apps khalifahks/centos-apps
# docker run -it --rm --name apps khalifahks/centos-apps
# docker exec -it apps bash
ENTRYPOINT ["tail", "-f", "/dev/null"]