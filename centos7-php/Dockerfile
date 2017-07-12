FROM centos:centos7

# Install the latest PHP packages
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
# We include this to get PHP version 7 since it's not in EPEL.
    https://mirrors.mediatemple.net/remi/enterprise/remi-release-7.rpm \
# This will help verify packages and reduce errors(red) in the output.
 && rpm --import \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-remi \

# Specify which version of PHP 7 to install here
 && yum-config-manager --enable remi,remi-php70 \
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

EXPOSE 9000

# docker build -t khalifahks/centos-php ./centos7-php
# docker run -d --rm -p 9000:9000 --name centos-php -h centos_php khalifahks/centos-php
# docker run -it --rm -p 9000:9000 --name centos-php -h centos_php khalifahks/centos-php
CMD ["php-fpm"]