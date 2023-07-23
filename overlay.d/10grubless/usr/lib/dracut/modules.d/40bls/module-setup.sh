#!/bin/bash

depends() {
    echo ignition rdcore
}

install_ignition_unit() {
    local unit=$1; shift
    local target=${1:-complete}
    inst_simple "$moddir/$unit" "$systemdsystemunitdir/$unit"
    # note we `|| exit 1` here so we error out if e.g. the units are missing
    # see https://github.com/coreos/fedora-coreos-config/issues/799
    systemctl -q --root="$initdir" add-requires "ignition-${target}.target" "$unit" || exit 1
}

install() {
    inst_multiple \
        mount \
        umount \
        sed \
        grep \
        cp \
        sha256sum
    install_ignition_unit coreos-shadow-boot.service diskful
    inst_script "$moddir/coreos-shadow-boot.sh" /usr/sbin/coreos-shadow-boot
}