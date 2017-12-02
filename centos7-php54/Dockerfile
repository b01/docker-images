FROM centos:centos7

# 1. Include the REMI RPM to get the latest PHP version.
# 2. Then we add the GPG keys to help verify packages and reduce errors(red) in the output.
# 3. Next we specify which version of PHP to install.
# 4. Install the PHP packages.
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    https://mirrors.mediatemple.net/remi/enterprise/remi-release-7.rpm \
 && rpm --import \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-remi \
 && yum-config-manager --enable remi,remi-php54 \
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

EXPOSE 9054

# docker build --rm --no-cache -t khalifahks/centos-php:54 ./centos7-php54
# docker run -d --rm -p 9000:9000 --name centos-php54 -h centos_php khalifahks/centos-php54
# docker run -it --rm -p 9000:9000 --name centos-php54 -h centos_php khalifahks/centos-php54
# docker exec -it centos-php54 bash
CMD ["php-fpm"]