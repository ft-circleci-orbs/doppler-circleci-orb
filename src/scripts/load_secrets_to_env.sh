#!/bin/bash
TOKEN=$(eval echo "\$$DOPPLER_TOKEN_NAME")
./doppler secrets download -t "${TOKEN}" --no-file --format env --project "$DOPPLER_PROJECT" > dopplerenv
sed -e 's/^/export /' dopplerenv >> "$BASH_ENV"
# shellcheck disable=SC1090
source "$BASH_ENV"
