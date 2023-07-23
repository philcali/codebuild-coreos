#!/usr/bin/env bash

BUILDSPEC=${1:-buildspec.yml}
BUILD_DIR=${2:-$HOME/coreos}

mkdir -p build
mkdir -p $BUILD_DIR

{
    echo "COREOS_ASSEMBLER_BUILD=$BUILD_DIR"
    echo "COREOS_ASSEMBLER_CONFIG_GIT=$PWD"
} > override.env

./codebuild_build.sh \
    -i coreos-builder -m -d \
    -a build/ \
    -e override.env \
    -s "$PWD" -s "CosaBuild:$BUILD_DIR" \
    -b "$BUILDSPEC"
