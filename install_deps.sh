#!/bin/sh
set -e -o pipefail

if [ -e ./deps_build.apk ]; then
  echo "./deps_build.apk file found, attempting build-time dependencies installation" >&2
  apk update && grep -v "^#\|^$" ./deps_build.apk | xargs apk add || exit 1
else
  echo "./deps_build.apk file NOT found, moving on.." >&2
fi

if [ -e ./deps.apk ]; then
  echo "./deps.apk file found, attempting dependencies installation" >&2
  apk update && grep -v "^#\|^$" ./deps.apk | xargs apk add || exit 1
else
  echo "./deps.apk file NOT found, moving on.." >&2
fi

if [ -x ./deps_build.sh ]; then
  echo "./deps_build.sh file found, executing it blindly.." >&2
  ./deps_build.sh --install || exit 1
else
  echo "./deps_build.sh file NOT found, moving on.." >&2
fi

if [ -x ./deps.sh ]; then
  echo "./deps.sh file found, executing it blindly.." >&2
  ./deps.sh || exit 1
else
  echo "./deps.sh file NOT found, moving on.." >&2
fi
