FROM centos:centos7

# Install the latest EPEL release RPM.
# Then add the GPG keys to help verify packages and reduce errors(red) in the output.
# Update the system
# Perform clean-up
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && rpm --import \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 \
 && yum -y update \
 && yum clean all

# Include the REMI release RPM to get the latest PHP version.
# Then add the GPG keys to help verify packages and reduce errors(red) in the output.
# Update the system
# Perform clean-up
RUN yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
 && rpm --import \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-remi \
 && yum -y update \
 && yum clean all \
 && rm -rf /var/cache/yum

# Specify which version of PHP to install.
# Update the system
# Install the PHP packages.
# Perform clean-up.
# Downloand PHP composer.
# Move the default configuration files out of the way.
# Make sure the pecl_http lib get loaded with php.
RUN yum-config-manager --enable remi,remi-php54 \
 && yum -y install php \
    php-bcmath \
    php-cli \
    php-common \
    php-devel \
    php-fpm \
    php-mbstring \
    php-mcrypt \
    php-mssql \
    php-mysql \
    php-pdo \
    php-pdo_dblib \
    php54-php-pecl-http1 \
    php-pecl-libsodium \
    php-pecl-memcache \
    php-pecl-memcached \
    php-pecl-zip \
    php-soap \
    php-tidy \
    php-xml \
 && yum clean all \
 && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin \
 && mv /etc/php.ini /etc/php.txt \
 && mv /etc/php-fpm.conf /etc/php-fpm.txt \
 && mv /etc/php-fpm.d/www.conf /etc/php-fpm.d/www.txt \
 && echo "extension=/opt/remi/php54/root/usr/lib64/php/modules/http.so" > /etc/php.d/http.ini

# Use custom PHP configs.
COPY ./php.ini /etc/php.ini
COPY ./php-fpm.conf /etc/php-fpm.conf
COPY ./www.conf /etc/php-fpm.d/www.conf

RUN mkdir -p /run/php-fpm && chown root:root /run/php-fpm

EXPOSE 9000
EXPOSE 10000

# docker build --rm --no-cache -t khalifahks/centos-php:54 ./centos7-php54
# docker build --rm -t khalifahks/centos-php:54 ./centos7-php54
# docker run -d --rm -p 9000:9000 --name centos-php54 -h centos_php54 khalifahks/centos-php:54
# docker run -it --rm -p 9000:9000 --name centos-php54 -h centos_php54 khalifahks/centos-php:54
# docker run --rm -p 9000:9000 --name centos-php54 -h centos_php54 khalifahks/centos-php:54
# docker exec -it centos-php54 bash

ENTRYPOINT ["php-fpm"]
CMD ["--help"]
