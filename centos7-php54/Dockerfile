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
RUN yum -y install https://mirrors.mediatemple.net/remi/enterprise/remi-release-7.rpm \
 && rpm --import \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-remi \
 && yum -y update \
 && yum clean all

# Specify which version of PHP to install.
# Update the system
# Install the PHP packages.
# Perform clean-up
# Downloand PHP composer
# Remove the default PHP configurations.
RUN yum-config-manager --enable remi,remi-php54 \
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
 && yum clean all \
 && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin

# Remove the default configuration files.
#RUN rm /etc/php.ini /etc/php-fpm.conf /etc/php-fpm.d/www.conf
RUN mv /etc/php.ini /etc/php.txt
RUN mv /etc/php-fpm.conf /etc/php-fpm.txt
RUN mv /etc/php-fpm.d/www.conf /etc/php-fpm.d/www.txt

# Use custom PHP configs.
ADD ./php.ini /etc/php.ini
ADD ./php-fpm.conf /etc/php-fpm.conf
ADD ./www.conf /etc/php-fpm.d/www.conf
ADD ./docker.conf /etc/php-fpm.d/docker.conf
ADD ./zz-docker.conf /etc/php-fpm.d/zz-docker.conf

EXPOSE 9000

# docker build --rm --no-cache -t khalifahks/centos-php:54 ./centos7-php54
# docker build --rm -t khalifahks/centos-php:54 ./centos7-php54
# docker run -d --rm -p 9000:9000 --name centos-php54 -h centos_php54 khalifahks/centos-php:54
# docker run -it --rm -p 9000:9000 --name centos-php54 -h centos_php54 khalifahks/centos-php:54
# docker exec -it centos-php54 bash
# TODO: See if we can run PHP-FPM in the background and then tail the error log to keep the system runing.
CMD ["php-fpm"]