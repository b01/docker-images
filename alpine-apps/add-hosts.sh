#!/bin/sh

echo "127.0.0.1 ${1}" >> /etc/hosts
echo "::1 ${1}" >> /etc/hosts

cat /etc/hosts