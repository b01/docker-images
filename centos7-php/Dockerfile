FROM centos:centos7

# Install the latest PHP packages
# We include the REMI RPM to get the latest PHP version.
# Then we add the GPG keys to help verify packages and reduce errors(red) in the output.
# Next we specify which version of PHP 7 to install.
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    https://mirrors.mediatemple.net/remi/enterprise/remi-release-7.rpm \
 && rpm --import \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-remi \
 && yum-config-manager --enable remi,remi-php71 \
 && yum -y update \
 && yum -y install php \
    php-bcmath \
    php-cli \
    php-common \
    php-devel \
    php-fpm \
    php-mbstring \
    php-mcrypt \
    php-pdo \
    php-pdo-dblib \
    php-pecl-libsodium \
    php-pecl-memcached \
    php-pecl-mongodb \
    php-pecl-mysql \
    php-pecl-zip \
    php-tidy \
    php-xml \
 && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin

# Remove the default configuration files.
RUN rm /etc/php.ini /etc/php-fpm.conf /etc/php-fpm.d/www.conf

# Use custom PHP configs.
ADD ./php.ini /etc/php.ini
ADD ./php-fpm.conf /etc/php-fpm.conf
ADD ./www.conf /etc/php-fpm.d/www.conf
ADD ./docker.conf /etc/php-fpm.d/docker.conf
ADD ./zz-docker.conf /etc/php-fpm.d/zz-docker.conf

EXPOSE 9000

# docker build --rm --no-cache -t khalifahks/centos-php ./centos7-php
# docker run -d --rm -p 9000:9000 --name centos-php -h centos_php khalifahks/centos-php
# docker run -it --rm -p 9000:9000 --name centos-php -h centos_php khalifahks/centos-php
# docker exec -it centos-php bash
CMD ["php-fpm"]