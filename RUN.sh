#!/bin/sh

set -e

die() {
	echo "$1" >&2
	exit 1
}

BUILD_DIR="build"
EXE_FILE="${BUILD_DIR}/bin/spike"

[ -x ${EXE_FILE} ] || die "executable not found"

${EXE_FILE}
