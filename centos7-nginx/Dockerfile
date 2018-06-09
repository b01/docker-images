FROM centos:centos7

# Install the latest EPEL release RPM.
# Then add the GPG keys to help verify packages and reduce errors(red) in the output.
# Update the system.
# Perform clean-up.
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && rpm --import \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 \
 && yum -y update \
 && yum clean all

# Install Nginx.
# Perform clean-up.
# Move default configuration out of the way.
RUN yum -y install nginx \
 && yum clean all \
 && mv /etc/nginx/nginx.conf /etc/nginx/nginx-org-conf.txt

# Add a custom nginx config
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./fastcgi_params /etc/nginx/fastcgi_params
COPY ./generate-self-signed-cert.sh /bin/generate-self-signed-cert.sh
COPY ./generate-named-ssl-cert.sh /bin/generate-named-ssl-cert.sh

RUN chmod a+x /bin/generate-self-signed-cert.sh \
 && chmod a+x /bin/generate-named-ssl-cert.sh \
 && generate-self-signed-cert.sh \
 && mkdir -p /etc/nginx/conf-docker.d && chown root:root /etc/nginx/conf-docker.d

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
 && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80
EXPOSE 443

# docker build --rm -t khalifahks/centos-nginx ./centos7-nginx
# docker build --rm --no-cache -t khalifahks/centos-nginx ./centos7-nginx
# docker run -d --rm -p 80:80 -p 443:443 --label production_status=centos-nginx --log-opt mode=non-blocking --name centos-nginx -h centos_nginx khalifahks/centos-nginx
# docker run -it --rm -p 80:80 -p 443:443 --label production_status=centos-nginx --log-opt mode=non-blocking --name centos-nginx -h centos_nginx khalifahks/centos-nginx
# docker exec -it centos-nginx bash

CMD ["nginx"]
