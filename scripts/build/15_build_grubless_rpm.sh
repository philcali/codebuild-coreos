#!/usr/bin/env bash

set -eux pipefail

. scripts/utils/_constants.sh

NAME="grubless"
VERSION="1.0.0"
ARCHIVE="${NAME}-${VERSION}"

rpmdev-setuptree

# COPY over specs
cp scripts/grubless/SPECS/*.spec "$HOME"/rpmbuild/SPECS/

# COPY over files
mkdir -p "$HOME"/rpmbuild/SOURCES/"$ARCHIVE"
for file in initramfs.img vmlinuz cmdline; do
    cp "$MOUNTED_COSA_BUILD"/tmp/build/uki/"$file" "$HOME"/rpmbuild/SOURCES/"$ARCHIVE"/
done

# COPY over configuration
for file in loader.conf firstboot-1-fcbls.conf; do
    cp "scripts/grubless/SOURCES/$file" "$HOME"/rpmbuild/SOURCES/"$ARCHIVE"/"$file"
done

# Append cmdline as options for firstboot
echo "options bls.shadow=ostree $(< "$MOUNTED_COSA_BUILD"/tmp/build/uki/cmdline)" >> "$HOME"/rpmbuild/SOURCES/"$ARCHIVE"/firstboot-1-fcbls.conf

# COPY systemd-boot
cp "/usr/lib/systemd/boot/efi/systemd-bootx64.efi" "$HOME"/rpmbuild/SOURCES/"$ARCHIVE"

pushd "$HOME"/rpmbuild/SOURCES
tar -c -z -f "$ARCHIVE".tar.gz "$ARCHIVE"
rm -rf "$ARCHIVE"
popd

# Build RPM
pushd "$HOME"
rpmbuild -bb rpmbuild/SPECS/"$NAME".spec
popd

BUILT_RPM=$(find "$HOME"/rpmbuild/RPMS/ -name "*.rpm")
cp "$BUILT_RPM" "$MOUNTED_COSA_BUILD"/builds/"$ARCHIVE".rpm