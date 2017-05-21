FROM local:php70

RUN yum -y update\
 && yum -y install git\
    php-pecl-xdebug\
 && yum clean all

RUN cd && mkdir app

WORKDIR app

CMD ['git', '--version']