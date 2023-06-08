#!/usr/bin/env bash

MOUNTED_COSA_BUILD=${CODEBUILD_SRC_DIR_CosaBuild:-../ccos}
COREOS_ASSEMBLER_CONFIG_GIT=${COREOS_ASSEMBLER_CONFIG_GIT:-$CODEBUILD_SRC_DIR}
COREOS_ASSEMBLER_BUILD=${COREOS_ASSEMBLER_BUILD:-../ccos}

mkdir -p ../ccos

cosa init --force /dev/null
cosa fetch
cosa build

ln -s $MOUNTED_COSA_BUILD ccos
