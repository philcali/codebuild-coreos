#!/usr/bin/env bash

main() {
   env | grep COREOS_ASSEMBLER
   local -r COREOS_ASSEMBLER_CONTAINER_LATEST="quay.io/coreos-assembler/coreos-assembler:latest"
   local COREOS_ASSEMBLER_CONTAINER_RUNTIME_ARGS=${COREOS_ASSEMBLER_CONTAINER_RUNTIME_ARGS:--e COSA_NO_KVM=1}
   set -x
              # -it
              #--uidmap=1000:0:1 --uidmap=0:1:1000 --uidmap 1001:1001:64536                          \
   docker run --rm --security-opt=label=disable --privileged                                        \
              -v=${COREOS_ASSEMBLER_BUILD:-$PWD}:/srv/                                              \
              --tmpfs=/tmp -v=/var/tmp:/var/tmp --name=cosa                                         \
              ${COREOS_ASSEMBLER_CONFIG_GIT:+-v=$COREOS_ASSEMBLER_CONFIG_GIT:/srv/src/config/:ro}   \
              ${COREOS_ASSEMBLER_GIT:+-v=$COREOS_ASSEMBLER_GIT/src/:/usr/lib/coreos-assembler/:ro}  \
              ${COREOS_ASSEMBLER_ADD_CERTS:+-v=/etc/pki/ca-trust:/etc/pki/ca-trust:ro}              \
              ${COREOS_ASSEMBLER_CONTAINER_RUNTIME_ARGS}                                            \
              ${COREOS_ASSEMBLER_CONTAINER:-$COREOS_ASSEMBLER_CONTAINER_LATEST} "$@"
   rc=$?; set +x; return $rc
}

main "$@"
