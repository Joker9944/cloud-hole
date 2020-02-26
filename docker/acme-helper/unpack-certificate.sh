#!/usr/bin/env bash

set -e

echo "Unpacking certificate for domain $DUMP_DOMAIN..."

cat "$TRAEFIK_ACME_STORE" | jq -r '.[].Certificates[] | select(.domain.main == "'"$DUMP_DOMAIN"'") | .certificate' | base64 -d > "$UNPACKED_CERTIFICATE_LOCATION"/fullchain.pem
chmod 600 "$UNPACKED_CERTIFICATE_LOCATION"/fullchain.pem
cat "$TRAEFIK_ACME_STORE" | jq -r '.[].Certificates[] | select(.domain.main == "'"$DUMP_DOMAIN"'") | .key' | base64 -d > "$UNPACKED_CERTIFICATE_LOCATION"/key.pem
chmod 600 "$UNPACKED_CERTIFICATE_LOCATION"/key.pem

echo "Successfully unpacked certificate."
