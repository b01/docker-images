FROM centos:centos7

# Install latest version of nginx
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && rpm --import \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 \
 && yum -y update \
 && yum -y install nginx \
 && yum clean all

# Don't run Nginx as a daemon. This lets the docker host monitor the process.
RUN rm /etc/nginx/nginx.conf

EXPOSE 80
EXPOSE 443

# Add a custom nginx config
ADD ./nginx.conf /etc/nginx/nginx.conf
ADD ./fastcgi_params /etc/nginx/fastcgi_params
ADD ./nginx-start.sh /nginx-start.sh
ADD ./generate-self-signed-cert.sh /generate-self-signed-cert.sh

RUN chmod a+x /nginx-start.sh
RUN chmod a+x /generate-self-signed-cert.sh && ./generate-self-signed-cert.sh

# docker run -d --rm -p 80:80 -p 443:443 --name centos-nginx -h centos_nginx khalifahks/centos-nginx
# docker run -it --rm -p 80:80 -p 443:443 --name centos-nginx -h centos_nginx khalifahks/centos-nginx
ENTRYPOINT ["nginx"]
#ENTRYPOINT ["./nginx-start.sh"]
