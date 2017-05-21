FROM local:php70

RUN yum -y update\
 && yum -y install git\
    php-pecl-xdebug\
    nodejs npm\
 && yum clean all

RUN cd && mkdir app

WORKDIR app

CMD ['git', '--version']

ENTRYPOINT ["/usr/bin/bash"]