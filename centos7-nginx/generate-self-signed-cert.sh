#!/bin/bash -e
#
# This is a modified version of, see:
#   https://samcaldwell.net/index.php/technical-articles/3-how-to-articles/173-how-to-generate-self-signed-ssltls-certificates-with-no-user-interaction
# generateSelfSignedCert
# (c) 2014 Sam Caldwell. Public Domain
#
KEYFILE=/etc/ssl/private/selfsigned.key
CSRFILE=/etc/ssl/selfsigned.csr
CRTFILE=/etc/ssl/certs/selfsigned.crt
SUBJ="/C=US/ST=MI/L=Detroit/O=Team Ultra/OU=Public Domain/CN=localhost"

mkdir -p /etc/ssl/private/ /etc/ssl/certs/

printf "\ncreating private key and CSR...\n"
openssl req \
        -nodes \
        -newkey rsa:2048 \
        -keyout ${KEYFILE} \
        -out ${CSRFILE} \
        -subj "${SUBJ}" || exit 1

printf "\nsigning CSR...\n"
openssl x509 \
    -req \
    -days 365 \
    -in ${CSRFILE} \
    -signkey ${KEYFILE} \
    -out ${CRTFILE} || exit 1

echo " "
echo "Generated self-signed certificate"
echo "   KEYFILE: ${KEYFILE}"
echo "   CSRFILE: ${CSRFILE}"
echo "   CRTFILE: ${CRTFILE}"
echo " "