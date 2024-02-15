#!/bin/bash

TOKEN=$(eval echo "\$$DOPPLER_TOKEN_NAME")

SECRETS=$(./doppler secrets download -t "${TOKEN}" --no-file --no-read-env --format json)

# Install jq if its not present
if ! command -v jq &> /dev/null
then
  if command -v apt-get &> /dev/null
  then
    apt-get install -y jq
  elif command -v apk &> /dev/null
  then
    apk add jq
  elif command -v brew &> /dev/null
  then
    HOMEBREW_NO_AUTO_UPDATE=1 brew install jq
  else
    echo "Unable to install jq. Unable to detect apt-get, apk or homebrew"
    exit 1
  fi
fi

echo -E "${SECRETS}" |
  jq 'del(.DOPPLER_CONFIG, .DOPPLER_PROJECT, .DOPPLER_ENVIRONMENT)' |
  jq -r 'to_entries[] | "export \(.key)=\"\(.value)\""' >> "$BASH_ENV"

# shellcheck disable=SC1090
source "$BASH_ENV"
