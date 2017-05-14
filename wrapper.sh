#!/bin/sh

cd /etc/quasselcore/

[ -f ./quasselCert.pem ] || ./gen_certificate.sh

exec /usr/bin/quasselcore $@
