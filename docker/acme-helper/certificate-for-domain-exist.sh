#!/usr/bin/env bash

cat "$TRAEFIK_ACME_STORE" | jq -e '.[].Certificates[] | select(.domain.main == "'"$DUMP_DOMAIN"'")' > /dev/null
