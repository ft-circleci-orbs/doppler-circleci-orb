#!/bin/bash
TOKEN=$(eval echo "\$$DOPPLER_TOKEN_NAME")
./doppler secrets download -t "${TOKEN}" --no-file --format env | grep -v '^DOPPLER_PROJECT=\|^DOPPLER_CONFIG=\|^DOPPLER_ENVIRONMENT=' > .circleci/.dopplerenv
sed -e 's/^/export /' .circleci/.dopplerenv >> "$BASH_ENV"
# shellcheck disable=SC1090
source "$BASH_ENV"
rm .circleci/.dopplerenv