FROM memcached:1-alpine

# docker build --rm --no-cache -t khalifahks/alpine-memcached ./alpine-memcached
# docker run -d --rm --name alpine-memcached -h alpine_memcached khalifahks/alpine-memcached
# docker exec -it alpine-memcached sh

ENTRYPOINT ["memcached"]
CMD ["-u", "daemon"]