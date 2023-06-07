#!/usr/bin/env bash

mkdir -p build

echo "COREOS_ASSEMBLER_BUILD=$PWD/coreos" > override.env

./codebuild_build.sh -i coreos-builder -m -d -a build/ -e override.env
