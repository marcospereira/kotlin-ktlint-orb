#!/usr/bin/env bash

# shellcheck disable=SC2086,SC2002

# ktlint version of default to latest
KTLINT_VERSION=${KTLINT_VERSION:-latest}
KTLINT_VERBOSE_INSTALL=${KTLINT_VERBOSE_INSTALL:-false}

CURL_VERBOSE_PARAMETERS="--silent"
if [ "$KTLINT_VERBOSE_INSTALL" = "true" ]; then
  set -x
  CURL_VERBOSE_PARAMETERS="--verbose"
fi

CURL_RETRY_PARAMETERS="--retry 5 --retry-delay 5 --retry-connrefused"

if [ "$KTLINT_VERSION" = "latest" ]; then
  # Use the HTTP redirection to avoid too many requests to the GitHub API
  location_header=$(

    curl --silent --head $CURL_RETRY_PARAMETERS https://github.com/pinterest/ktlint/releases/latest |
    grep -i location
  )

  # See https://www.linuxjournal.com/article/8919
  KTLINT_VERSION=$(echo "${location_header##*/}" | tr -d '\r' | xargs)
fi

curl -SLO \
  "$CURL_VERBOSE_PARAMETERS" \
  $CURL_RETRY_PARAMETERS \
  "https://github.com/pinterest/ktlint/releases/download/$KTLINT_VERSION/ktlint"

# Verify the downloaded file signature
curl --silent --show-error $CURL_RETRY_PARAMETERS https://keybase.io/ktlint/pgp_keys.asc | gpg --import
curl -silent -SLO "https://github.com/pinterest/ktlint/releases/download/$KTLINT_VERSION/ktlint.asc"
gpg --verify ktlint.asc

chmod +x ktlint

os_id=$(cat /etc/os-release | grep "^ID=" | cut -d'=' -f2 | tr -d '"')
if [ "$os_id" = "alpine" ]; then
    if [ "$ID" = 0 ]; then export SUDO=""; else export SUDO="sudo"; fi
else
    if [[ $EUID == 0 ]]; then export SUDO=""; else export SUDO="sudo"; fi
fi

$SUDO mv ktlint /usr/local/bin
