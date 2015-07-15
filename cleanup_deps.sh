#!/bin/sh
set -e -o pipefail

if [ -e ./deps_build.apk ]; then
  echo "./deps_build.apk file found, cleaning up build dependencies" >&2
  grep -v "^#\|^$" ./deps_build.apk | xargs apk del --purge || exit 1
else
  echo "./deps_build.apk file NOT found, moving on.." >&2
fi

if [ -x ./deps_build.sh ]; then
  echo "./deps_build.sh file found, requesting cleanup.." >&2
  ./deps_build.sh --cleanup || exit 1
else
  echo "./deps_build.sh file NOT found, moving on.." >&2
fi

