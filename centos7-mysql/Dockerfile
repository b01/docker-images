FROM centos:centos7

# Check for Updates:
# https://dev.mysql.com/downloads/repo/yum/

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

ADD ./mysql-community.repo /etc/yum.repos.d/mysql-community.repo

RUN yum repolist enabled | grep mysql \
 && yum -y update \
 && yum-config-manager --disable mysql55-community \
 && yum-config-manager --disable mysql56-community \
 && yum-config-manager --enable mysql57-community \
 && yum-config-manager --disable mysql80-community \
 && yum -y install --skip-broken mysql-community-server \
 && yum clean all \
 && rm -rf /var/cache/yum

EXPOSE  3306

# docker build --rm --no-cache -t khalifahks/centos-mysql ./centos7-mysql
# docker build --rm -t khalifahks/centos-mysql ./centos7-mysql
# docker run -d --rm -p 3306:3306 --name centos-mysql -h centos_mysql khalifahks/centos-mysql
# docker run -it --rm -p 3306:3306 --name centos-mysql -h centos_mysql khalifahks/centos-mysql
# docker exec -it centos-mysql bash
ENTRYPOINT ["mysqld"]