#!/bin/bash
TOKEN=$(eval echo "\$$DOPPLER_TOKEN_NAME")
./doppler secrets download -t "${TOKEN}" --no-file --format env > dopplerenv
sed -e 's/^/export /' dopplerenv | grep -v '^DOPPLER_PROJECT=\|^DOPPLER_CONFIG=\|^DOPPLER_ENVIRONMENT=' >> "$BASH_ENV"
# shellcheck disable=SC1090
source "$BASH_ENV"
