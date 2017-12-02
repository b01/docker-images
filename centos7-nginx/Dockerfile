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

# Install latest version of nginx
RUN yum -y update \
 && yum -y install nginx \
 && yum clean all \
 && rm /etc/nginx/nginx.conf

# Add a custom nginx config
ADD ./nginx.conf /etc/nginx/nginx.conf
ADD ./fastcgi_params /etc/nginx/fastcgi_params
ADD ./generate-self-signed-cert.sh /generate-self-signed-cert.sh

RUN chmod a+x /generate-self-signed-cert.sh \
 && ./generate-self-signed-cert.sh

EXPOSE 80
EXPOSE 443

# docker build --rm -t khalifahks/centos-nginx ./centos7-nginx
# docker build --rm --no-cache -t khalifahks/centos-nginx ./centos7-nginx
# docker run -d --rm -p 80:80 -p 443:443 --name centos-nginx -h centos_nginx khalifahks/centos-nginx
# docker run -it --rm -p 80:80 -p 443:443 --name centos-nginx -h centos_nginx khalifahks/centos-nginx
# docker exec -it centos-nginx bash
# TODO: See if we can run Nginx in the background and then tail the error log to keep the system runing.
ENTRYPOINT ["nginx"]
