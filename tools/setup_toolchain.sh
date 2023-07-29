#!/bin/bash

set -eu

declare -r LAX_TOOLCHAIN='/tmp/lax-toolchain'

if [ -d "${LAX_TOOLCHAIN}" ]; then
	PATH+=":${LAX_TOOLCHAIN}/bin"
	export LAX_TOOLCHAIN \
		PATH
	return 0
fi

declare -r LAX_CROSS_TAG="$(jq --raw-output '.tag_name' <<< "$(curl --retry 10 --retry-delay 3 --silent --url 'https://api.github.com/repos/AmanoTeam/lax/releases/latest')")"
declare -r LAX_CROSS_TARBALL='/tmp/lax.tar.xz'
declare -r LAX_CROSS_URL="https://github.com/AmanoTeam/Lax/releases/download/${LAX_CROSS_TAG}/x86_64-unknown-linux-gnu.tar.xz"

curl --retry 10 --retry-delay 3 --silent --location --url "${LAX_CROSS_URL}" --output "${LAX_CROSS_TARBALL}"
tar --directory="$(dirname "${LAX_CROSS_TARBALL}")" --extract --file="${LAX_CROSS_TARBALL}"

rm "${LAX_CROSS_TARBALL}"

mv '/tmp/lax' "${LAX_TOOLCHAIN}"

PATH+=":${LAX_TOOLCHAIN}/bin"

export LAX_TOOLCHAIN \
	PATH
