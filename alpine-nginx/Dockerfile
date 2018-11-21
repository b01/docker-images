FROM nginx:1-alpine

# Add a custom nginx config
COPY ./custom-nginx.conf /etc/nginx/
COPY ./generate-self-signed-cert.sh /bin/
COPY ./generate-named-ssl-cert.sh /bin/

# Install some dependencies.
RUN apk --update add --no-cache openssl \
 && mkdir -p /etc/nginx/conf-docker.d && chown root:root /etc/nginx/conf-docker.d \
 && chmod a+x /bin/generate-self-signed-cert.sh \
 && chmod a+x /bin/generate-named-ssl-cert.sh \
 && generate-self-signed-cert.sh \
 && ln -sf /dev/stdout /var/log/nginx/access.log \
 && ln -sf /dev/stderr /var/log/nginx/error.log \
 && nginx -v

# docker build --rm --no-cache -t khalifahks/alpine-nginx ./alpine-nginx
# docker run -it --rm --label production_status=alpine-nginx --log-opt mode=non-blocking --name alpine-nginx -h alpine_nginx khalifahks/alpine-nginx
# docker exec -it alpine-nginx sh

ENTRYPOINT ["nginx"]
CMD ["-c", "/etc/nginx/custom-nginx.conf"]