FROM khalifahks/centos-php

RUN yum -y update \
 && yum -y install git \
    php-pecl-xdebug \
    nodejs npm \
 && yum clean all

RUN cd && mkdir apps

WORKDIR /apps

RUN php --version && git --version

# docker build -t khalifahks/centos-apps ./apps
# docker run -d --rm --name apps khalifahks/centos-apps
# docker run -it --rm --name apps khalifahks/centos-apps
# docker exec -it area51_apps_1 bash
ENTRYPOINT ["tail", "-f", "/dev/null"]