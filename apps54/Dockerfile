FROM khalifahks/centos-php:54

# Install yarn RPMs and GPG keys
RUN curl -sS https://dl.yarnpkg.com/rpm/yarn.repo >> /etc/yum.repos.d/yarn.repo \
 && curl -sS https://dl.yarnpkg.com/rpm/pubkey.gpg >> /etc/pki/rpm-gpg/RPM-GPG-KEY-yarn \
 && rpm --import etc/pki/rpm-gpg/RPM-GPG-KEY-yarn \
 && echo "sslverify=false" >> /etc/yum.conf \
 && curl -sSk https://rpm.nodesource.com/pub_9.x/el/7/x86_64/nodesource-release-el7-1.noarch.rpm >> ./nodesource-release-el7-1.noarch.rpm \
 && yum -y install --nogpgcheck ./nodesource-release-el7-1.noarch.rpm

RUN yum -y update \
 && yum -y install git \
    php-pecl-xdebug \
    nodejs \
    yarn \
    firefox \
    java-1.8.0-openjdk \
 && yum clean all \
 && rm -rf var/yum/cache \
 && mkdir -p code

WORKDIR code

# docker build --rm --no-cache -t khalifahks/centos-apps:54 ./apps54
# docker build --rm -t khalifahks/centos-apps:54 ./apps54
# docker run -d --rm --name centos-apps54 khalifahks/centos-apps:54
# docker run -it --rm --name centos-apps54 khalifahks/centos-apps:54
# docker run --rm --name centos-apps54 khalifahks/centos-apps:54
# docker exec -it centos-apps54 bash
#ENTRYPOINT ["tail", "-f", "/dev/null"]
#ENTRYPOINT ["php-fpm"]
ENTRYPOINT ["start-php-fpm.sh"]