#!/usr/bin/env bash

set -e

echo "Waiting for traefik to generate certificate for domain $DUMP_DOMAIN..."
until certificate-for-domain-exist; do
	echo "Certificate for domain $DUMP_DOMAIN not found, waiting..."
	inotifywait --quiet --event modify "$TRAEFIK_ACME_STORE"
	echo "Certificate store has changed."
done
echo "Certificate for domain $DUMP_DOMAIN found."
unpack-certificate

echo "Waiting for certificate store to change..."
inotifywait --quiet --event close_write --monitor "$TRAEFIK_ACME_STORE" | \
	while read -r notifies; do
		echo "Certificate store has changed..."
		unpack-certificate
		echo "Restarting inbound CoreDNS container..."
		curl -sX POST --unix-socket /var/run/docker.sock http:/docker/containers/coredns-inbound/restart > /dev/stdout 2> /dev/stderr
		echo "Waiting for certificate store to change..."
	done
