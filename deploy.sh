#!/bin/bash

set -e


APP_NAME=travis-example
MANIFEST=manifest.yml


platform='linux'
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
  platform='darwin'
fi


if ! (cf plugins | grep -q antifreeze); then
  echo "Installing antifreeze..."
  cf install-plugin -f "https://github.com/odlp/antifreeze/releases/download/v0.3.0/antifreeze-$platform"
fi

echo "Checking the manifest..."
cf check-manifest "$APP_NAME" -f "$MANIFEST"


if ! (cf plugins | grep -q autopilot); then
  echo "Installing autopilot..."
  cf install-plugin -f "https://github.com/contraband/autopilot/releases/download/0.0.3/autopilot-$platform"
fi

echo "Deploying..."
cf zero-downtime-push "$APP_NAME" -f "$MANIFEST"
