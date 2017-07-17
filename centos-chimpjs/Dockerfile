FROM centos:centos7

WORKDIR /tmp/

ENV FILES ./files

ADD ./files $FILES

# Install Certificates
RUN yum -y install \
    https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
# We include this to get PHP version 7 since it's not in EPEL.
#    http://repo1.ash.innoscale.net/remi/enterprise/remi-release-7.rpm \
# This will help verify packages and reduce errors(red) in the output.
 && rpm --import \
    /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 \
    /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 \
# Install git, Nginx, NodeJS, NPM, and PHP and extensions
 && yum -y update \
 && yum -y install \
    git-core \
    nodejs \
    npm \
    openssl \
# Install PhantomJS dependencies
    fontconfig \
    freetype \
    freetype-devel \
    fontconfig-devel \
    libstdc++ \
    wget \
    bzip2 \
# Cleanup
 && yum clean all \
 && chmod 0775 $FILES/*.sh \
# Install PhantomJS
 && $FILES/install-phantomjs.sh \
 && npm install -g chimp

# Build/run/login commands
# docker build -t khalifahks/centos-chimpjs:latest ./centos-chimpjs
# docker run -it --rm -h chimpjs --name chimpjs khalifahks/centos-chimpjs:latest
# docker exec -it chimpjs bash
# docker rmi khalifahks/centos-chimpjs:latest
#CMD ["npm", "~/apps/chimp-automation/index.js"]
ENTRYPOINT ["tail", "-f", "/dev/null"]
