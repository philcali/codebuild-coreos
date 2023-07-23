#!/usr/bin/env bash

set -euo pipefail

MOUNTED_COSA_BUILD=${CODEBUILD_SRC_DIR_CosaBuild:-../ccos}
SYSTEMD_LIB=/usr/lib/systemd
EFI_STUB=$SYSTEMD_LIB/boot/efi/linuxx64.efi.stub

$SYSTEMD_LIB/ukify \
    --cmdline @"$MOUNTED_COSA_BUILD"/tmp/build/uki/cmdline \
    --os-release @"$MOUNTED_COSA_BUILD"/tmp/build/uki/os-release \
    --uname "$(< "$MOUNTED_COSA_BUILD"/tmp/build/uki/uname)" \
    --stub "$EFI_STUB" \
    "$MOUNTED_COSA_BUILD"/tmp/build/uki/vmlinuz \
    "$MOUNTED_COSA_BUILD"/tmp/build/uki/initramfs.img
