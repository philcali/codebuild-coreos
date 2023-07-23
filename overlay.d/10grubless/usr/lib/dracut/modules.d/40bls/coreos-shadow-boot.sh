#!/bin/bash

bootdev=/dev/disk/by-label/boot
espdev=/dev/disk/by-label/EFI-SYSTEM

for blockdev in $bootdev $espdev; do
  if ! [ -b "${blockdev}" ]; then
    echo "$0: Failed to find block device ${blockdev}" 1>&2
    exit 1
  fi
done

bootmnt=$(mktemp -d)
espmnt=$(mktemp -d)


# TODO: move the target bls around for systemd-boot