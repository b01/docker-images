FROM khalifahks/area51:php70

RUN yum -y update\
 && yum -y install git\
    php-pecl-xdebug\
    nodejs npm\
 && yum clean all

RUN cd && mkdir app

WORKDIR /apps

RUN php --version && git --version

# docker run -d --rm --name apps khalifahks/area51:apps
# docker run -it --rm --name apps khalifahks/area51:apps
ENTRYPOINT ["/usr/bin/bash"]