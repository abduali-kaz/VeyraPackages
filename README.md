# Veyra Packages

Package recipes for the Veyra OS project.

## Current package

- veyra: Rust-based Veyra OS system tools.

## Local build

On Arch Linux, install base-devel, git and cargo, then run:

    cd packages/veyra
    makepkg -s

The resulting .pkg.tar.zst file can be installed with pacman.
Repository publication and package signatures are being developed.
