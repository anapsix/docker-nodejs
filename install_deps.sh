#!/bin/sh
set -e -o pipefail

if [ -e ./deps.apk ]; then
  echo "./deps.apk file found, attempting dependencies installation" >&2
  apk update && grep -v "^#\|^$" ./deps.apk | xargs apk add
else
  echo "./deps.apk file NOT found, moving on.." >&2
fi

if [ -x ./deps.sh ]; then
  echo "./deps.sh file found, executing it blindly.." >&2
  ./deps.sh
else
  echo "./deps.sh file NOT found, moving on.." >&2
fi
