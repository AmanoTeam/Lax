#!/bin/bash

declare packages=(
	'http://archive.debian.org/debian/pool/main/l/linux/linux-libc-dev_3.2.78-1_ia64.deb'
	'http://archive.debian.org/debian/pool/main/e/eglibc/libc6.1-dev_2.13-38+deb7u10_ia64.deb'
	'http://archive.debian.org/debian/pool/main/e/eglibc/libc6.1_2.13-38+deb7u10_ia64.deb'
)

declare extra_configure_flags='--disable-libsanitizer'

declare triplet='ia64-unknown-linux-gnu'
declare host='ia64-linux-gnu'

declare output_format='elf64-ia64-little'
declare ld='ld-linux-ia64.so.2'

declare debian_release_major='7'
