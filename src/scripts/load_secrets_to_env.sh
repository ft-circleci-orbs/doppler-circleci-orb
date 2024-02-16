#!/bin/bash

TOKEN=$(eval echo "\$$DOPPLER_TOKEN_NAME")

SECRETS=$(./doppler secrets download -t "${TOKEN}" --no-file --no-read-env --format json)

echo -E "${SECRETS}" |
  jq 'del(.DOPPLER_CONFIG, .DOPPLER_PROJECT, .DOPPLER_ENVIRONMENT)' |
  jq -r 'to_entries[] | "export \(.key)=\"\(.value)\""' >> "$BASH_ENV"

# shellcheck disable=SC1090
source "$BASH_ENV"
