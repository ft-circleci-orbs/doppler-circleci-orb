#!/bin/bash
set +e

# Install gnupg if its not present
if ! command -v gpg &> /dev/null
then
  if command -v apt-get &> /dev/null
  then
    apt-get install -y gnupg
  elif command -v apk &> /dev/null
  then
    apk add bash curl gnupg
  elif command -v brew &> /dev/null
  then
    HOMEBREW_NO_AUTO_UPDATE=1 brew install gnupg
  else
    echo "Please install gnupg before installing doppler. Unable to detect apt-get, apk or homebrew"
    exit 1
  fi
fi

# Install doppler cli
(curl -Ls --tlsv1.2 --proto "=https" --retry 3 https://cli.doppler.com/install.sh || wget -t 3 -qO- https://cli.doppler.com/install.sh) | sh -s -- --no-install --no-package-manager
