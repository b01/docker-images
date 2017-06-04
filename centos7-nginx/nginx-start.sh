#!/bin/bash

# Dump all the nameservers into a variable.
DOCKER_DNS=$(cat /etc/resolv.conf | grep "nameserver" | awk '{print $2}' | tr '\n' ' ')

# Replace the variable in the conf file with the list of name servers.
sed -i "s#DOCKER_DNS#${DOCKER_DNS}#g" /etc/nginx/nginx.conf

# Debugging
#printf "\n${DOCKER_DNS}\n";
#cat /etc/nginx/nginx.conf

exec nginx