#!/usr/bin/env bash

set -euo pipefail

. scripts/utils/_constants.sh

GRUBLESS_REPO="$CODEBUILD_SRC_DIR_CosaBuild"/grubless

rm -rf "$GRUBLESS_REPO"
mkdir -p "$GRUBLESS_REPO"

cp "$CODEBUILD_SRC_DIR_CosaBuild/builds/grubless-1.0.0.rpm" "$GRUBLESS_REPO"

pushd "$GRUBLESS_REPO"
createrepo .
popd