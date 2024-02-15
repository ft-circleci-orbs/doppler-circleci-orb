#!/bin/bash
set +e

# Install gnupg if its not present
if ! command -v gpg &> /dev/null
then
  echo "Installing gnupg ..."

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

  echo "gnupg installed."
fi

# Install doppler cli
echo "Installing Doppler CLI ..."
(curl -Ls --tlsv1.2 --proto "=https" --retry 3 https://cli.doppler.com/install.sh || wget -t 3 -qO- https://cli.doppler.com/install.sh) | sh -s -- --no-install --no-package-manager
echo "Doppler ClI installed.
"
# Install jq if its not present
if ! command -v jq &> /dev/null
then
  echo "Installing jq ..."

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
   echo "jq installed."
fi