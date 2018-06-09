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

RUN yum -y install memcached --nogpgcheck \
 && yum clean all

EXPOSE  11211

# docker run -d --rm -p 11211:11211 --name centos-memcached -h centos_memcached khalifahks/centos-memcached
# docker run -it --rm -p 11211:11211 --name centos-memcached -h centos_memcached khalifahks/centos-memcached
CMD ["memcached", "-u", "daemon"]