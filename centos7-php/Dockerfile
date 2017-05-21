FROM centos:centos7

# Install the latest PHP packages
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm\
    http://rpms.remirepo.net/enterprise/remi-release-7.rpm\

 && rpm --import \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7\
      /etc/pki/rpm-gpg/RPM-GPG-KEY-remi\
      /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7\

 && yum-config-manager --enable remi,remi-php70\

 && yum -y install php php-fpm php-common\
    php-mbstring\
    php-mcrypt\
    php-devel\
    php-xml\
    php-mysqlnd\
    php-pdo\
    php-bcmath\
    php-pecl-memcached\
    php-pecl-mysql\

 && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin

# Remove the default configuration files.
RUN rm /etc/php.ini /etc/php-fpm.conf /etc/php-fpm.d/www.conf

# Use custom PHP configs.
ADD ./php.ini /etc/php.ini
ADD ./php-fpm.conf /etc/php-fpm.conf
ADD ./www.conf /etc/php-fpm.d/www.conf

EXPOSE 9000

# docker run -d --rm -p 9000:9000 --name php70-fpm -h php70-fpm local:php70
# docker run -it --rm -p 9000:9000 --name php70-fpm -h php70-fpm local:php70
CMD ["php-fpm", "-F"]