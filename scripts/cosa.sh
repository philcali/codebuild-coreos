#!/usr/bin/env bash

MOUNTED_COSA_BUILD=${CODEBUILD_SRC_DIR_CosaBuild:-../ccos}
COREOS_ASSEMBLER_CONFIG_GIT=${COREOS_ASSEMBLER_CONFIG_GIT:-$CODEBUILD_SRC_DIR}
COREOS_ASSEMBLER_BUILD=${COREOS_ASSEMBLER_BUILD:-../ccos}

mkdir -p ../ccos

for repo_file in fedora.repo fedora-coreos-pool.repo; do
    cp $CODEBUILD_SRC_DIR/fedora-coreos-config/$repo_file $CODEBUILD_SRC_DIR/$repo_file
done

cosa init --force /dev/null
cosa fetch
#cosa build

[ -L ccos ] && unlink ccos
ln -s $MOUNTED_COSA_BUILD ccos
