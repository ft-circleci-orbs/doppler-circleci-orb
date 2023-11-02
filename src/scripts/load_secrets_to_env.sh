#!/bin/bash

TOKEN=$(eval echo "\$$DOPPLER_TOKEN_NAME")

SECRETS=$(doppler secrets download -t "${TOKEN}" --no-file --no-read-env --format env)

while IFS= read -r secret; do
  echo "export $secret" >> "$BASH_ENV"
done < <(printf '%s' "$SECRETS" | grep -v '^DOPPLER_PROJECT=\|^DOPPLER_CONFIG=\|^DOPPLER_ENVIRONMENT=')

# shellcheck disable=SC1090
source "$BASH_ENV"
