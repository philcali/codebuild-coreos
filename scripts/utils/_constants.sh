#!/usr/bin/env bash

MOUNTED_COSA_BUILD=${CODEBUILD_SRC_DIR_CosaBuild:-../ccos}
export COREOS_ASSEMBLER_CONFIG_GIT=${COREOS_ASSEMBLER_CONFIG_GIT:-$CODEBUILD_SRC_DIR}
export COREOS_ASSEMBLER_BUILD=${COREOS_ASSEMBLER_BUILD:-../ccos}

for script in scripts/cosa/cmd-*; do
    script_name=$(basename "$script")
    export COREOS_ASSEMBLER_CONTAINER_RUNTIME_ARGS+=" -v $COREOS_ASSEMBLER_CONFIG_GIT/$script:/usr/lib/coreos-assembler/$script_name "
done