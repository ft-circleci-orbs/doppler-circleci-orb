#!/bin/bash

TOKEN=$(eval echo "\$$DOPPLER_TOKEN_NAME")

SECRETS=$(./doppler secrets download -t "${TOKEN}" --no-file --no-read-env --format env | grep -v '^DOPPLER_PROJECT=\|^DOPPLER_CONFIG=\|^DOPPLER_ENVIRONMENT=')

for secret in "$SECRETS"; do
    echo "export $secret" >> "$BASH_ENV"
done

# shellcheck disable=SC1090
source "$BASH_ENV"
