#!/bin/sh

set -e

die() {
	echo "$1" >&2
	exit 1
}

if ! which conan; then
	die "need conan to build this"
fi

if ! which cmake; then
	die "need cmake to build this"
fi

BUILD_DIR="build"

[ ! -d $BUILD_DIR ] || die "build dir exists already"

mkdir $BUILD_DIR
cd $BUILD_DIR

cmake -DCMAKE_C_COMPILER=/usr/local/bin/iceclang -DCMAKE_CXX_COMPILER=/usr/local/bin/iceclang++ -DCMAKE_BUILD_TYPE=Release ..
make
