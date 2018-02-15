FROM khalifahks/centos-php:54

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

# docker build --rm --no-cache -t khalifahks/centos-apps:54 ./apps54
# docker run -d --rm --name centos-apps54 khalifahks/centos-apps:54
# docker run -it --rm --name centos-apps54 khalifahks/centos-apps:54
# docker exec -it centos-apps54 bash
ENTRYPOINT ["tail", "-f", "/dev/null"]