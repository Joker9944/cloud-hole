FROM debian:stable-slim

ENV TRAEFIK_ACME_STORE /etc/traefik/acme.json
ENV UNPACKED_CERTIFICATE_LOCATION /etc/acme-helper

RUN apt-get update && \
		apt-get upgrade --yes --show-upgraded && \
		apt-get install --yes jq && \
		apt-get install --yes inotify-tools && \
		apt-get install --yes curl

COPY unpack-certificate.sh /usr/local/bin/unpack-certificate
COPY certificate-for-domain-exist.sh /usr/local/bin/certificate-for-domain-exist
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint
ENTRYPOINT docker-entrypoint
