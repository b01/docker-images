FROM khalifahks/area51:php70

RUN yum -y update\
 && yum -y install git\
    php-pecl-xdebug\
    nodejs npm\
 && yum clean all

RUN cd && mkdir app

WORKDIR /web-apps

CMD ['git', '--version']

# docker run -d --rm --name web-app khalifahks/area51:web-app
ENTRYPOINT ["/usr/bin/bash"]