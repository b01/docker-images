FROM centos:centos7

# Install latest version of nginx
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm\

 && rpm --import \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7\
      /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7\

 && yum -y update\
 && yum -y install nginx\
 && yum clean all

# Don't run Nginx as a daemon. This lets the docker host monitor the process.
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/nginx.conf

# Add a custom nginx config
ADD ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
EXPOSE 443

#CMD [ "nginx" ]
#CMD ["nginx", "-g", "daemon off;"]
CMD ["/usr/bin/bash", "nginx"]
# docker run -d --rm --name nginx -h nginx local:nginx
# docker run -it --rm --name nginx -h nginx local:nginx
#ENTRYPOINT ["/usr/bin/bash"]