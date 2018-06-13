FROM khalifahks/centos-apps

# Install Nginx.
# Install Google Chrome.
# Perform clean-up.
# Move default configuration out of the way.
RUN yum -y install nginx \
 && yum clean all \
 && rm -rf /var/cache/yum \
 && mv /etc/nginx/nginx.conf /etc/nginx/nginx.txt

# Add NGinX support files.
ADD nginx/nginx.conf /etc/nginx/nginx.conf
ADD nginx/fastcgi_params /etc/nginx/fastcgi_params
ADD nginx/generate-self-signed-cert.sh /bin/generate-self-signed-cert.sh
ADD nginx/generate-named-ssl-cert.sh /bin/generate-named-ssl-cert.sh
ADD servers-start.sh /bin/servers-start.sh

RUN chmod a+x /bin/generate-self-signed-cert.sh \
 && chmod a+x /bin/generate-named-ssl-cert.sh \
 && chmod a+x /bin/servers-start.sh \
 && generate-self-signed-cert.sh

# Remove unneeded programs/libs.
RUN yum -y erase httpd httpd-tools apr apr-util

EXPOSE 80
EXPOSE 443

# docker build --rm --no-cache -t khalifahks/centos-cci cci
# docker build --rm -t khalifahks/centos-cci cci
# docker run -d --rm -p 80:80 -p 443:443 --name centos-cci -h centos_cci khalifahks/centos-cci
# docker run -it --rm -p 80:80 -p 443:443 --name centos-cci -h centos_cci khalifahks/centos-cci
# docker exec -it centos-nginx bash

ENTRYPOINT ["servers-start.sh"]