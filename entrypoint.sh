#!/bin/sh
set -e -o pipefail

/install_deps.sh

echo "NPM install" >&2
npm install

echo "NPM start" >&2
exec npm start

echo fin.
