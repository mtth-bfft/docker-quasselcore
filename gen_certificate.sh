#!/bin/sh

[ -f quasselCert.pem ] && echo "Certificate already exists, not overwriting." >&2 && exit 1

# Run from within container
if [ -f /etc/quasselcore/openssl.cnf ]; then
	CONF_PATH=/etc/quasselcore/openssl.cnf
# Run from outside container
elif [ -f ./openssl.cnf ]; then
	CONF_PATH=./openssl.cnf
else
	echo "Cannot find openssl.cnf. Please run from within a running container." >&2 && exit 2
fi

openssl req -new -x509 -config "$CONF_PATH" -batch -keyout quasselCert.pem -out quasselCert.pem

chmod 600 quasselCert.pem
