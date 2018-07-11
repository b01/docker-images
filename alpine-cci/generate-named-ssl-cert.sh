#!/bin/sh -e
#
# This is a modified version of, see:
#   https://samcaldwell.net/index.php/technical-articles/3-how-to-articles/173-how-to-generate-self-signed-ssltls-certificates-with-no-user-interaction
# generateSelfSignedCert
# (c) 2014 Sam Caldwell. Public Domain
#

if [ -z "${1}" ]; then
   printf "\nPlease enter the full domain name.\n"
fi

CERT_DIR="/etc/ssl/nginx"
KEYFILE="${CERT_DIR}/${1}.key"
CSRFILE="${CERT_DIR}/${1}.csr"
CRTFILE="${CERT_DIR}/${1}.crt"
SUBJ="/C=US/ST=Michigan/L=Detroit/O=Quicken Loans/OU=Team Ultra/CN=${1}"

mkdir -p "${CERT_DIR}"

if [ -f "${CERT_DIR}/${1}.key" ]; then
    printf "\nThis cert already exists, removing all its files.\n"
    rm -fv "${CERT_DIR}/${1}.crt" 
    rm -fv "${CERT_DIR}/${1}.csr" 
    rm -fv "${CERT_DIR}/${1}.pass.key" 
    rm -fv "${CERT_DIR}/${1}.key" 
fi

openssl genrsa -des3 -passout pass:x -out "${CERT_DIR}/${1}".pass.key 2048

printf "\nMaking the private key:"
openssl rsa -passin pass:x -in "${CERT_DIR}/${1}".pass.key -out "${CERT_DIR}/${1}".key

rm -fv "${CERT_DIR}/${1}".pass.key

printf "\nMakeing CSR"
openssl req -new -key ${KEYFILE} -out ${CSRFILE} -subj "${SUBJ}"
printf " ok\n"

printf "Signing CSR..."
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