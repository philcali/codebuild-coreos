#!/usr/bin/env bash

. scripts/utils/_constants.sh

[ -L builds ] && unlink builds
ln -s "$MOUNTED_COSA_BUILD"/builds builds