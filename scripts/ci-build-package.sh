#!/usr/bin/env bash
set -euo pipefail

pacman -Syu --noconfirm
pacman -S --needed --noconfirm base-devel git rust cargo

useradd --create-home --shell /bin/bash builder
install -d -o builder -g builder /tmp/veyra-build/veyra

install -m 644 \
    /workspace/packages/veyra/PKGBUILD \
    /workspace/packages/veyra/.SRCINFO \
    /tmp/veyra-build/veyra/

chown -R builder:builder /tmp/veyra-build

su builder -s /bin/bash -c \
    'cd /tmp/veyra-build/veyra && makepkg --cleanbuild --force --noconfirm'

PACKAGE="$(find /tmp/veyra-build/veyra -maxdepth 1 -type f \
    -name 'veyra-[0-9]*-x86_64.pkg.tar.zst' -print -quit)"

test -n "$PACKAGE"
install -m 644 "$PACKAGE" /output/
echo "Package built successfully."
