#!/usr/bin/env bash

set -euo pipefail

. scripts/utils/_constants.sh

mkdir -p "$MOUNTED_COSA_BUILD"/src
chown -R 1000:1000 "$MOUNTED_COSA_BUILD"/src

read -r -a TARGETS <<< "${BUILD_TARGETS:-qemu}"

cosa init --variant "$VARIANT" --force /dev/null
cosa fetch
cosa "$BUILD_COMMAND" "${TARGETS[@]}"
