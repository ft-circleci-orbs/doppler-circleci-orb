#!/bin/bash

TOKEN=$(eval echo "\$$DOPPLER_TOKEN_NAME")

SECRETS=$(./doppler secrets download -t "${TOKEN}" --no-file --no-read-env --format json)

python parse_secrets.py $SECRETS >> "$BASH_ENV"

# shellcheck disable=SC1090
source "$BASH_ENV"
