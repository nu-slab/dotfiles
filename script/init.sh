#!/bin/bash

DOTDIR="$HOME/.dotfiles"

has() {
    type "$1" > /dev/null 2>&1
}

if [ ! -d ${DOTDIR} ]; then
    if has "git"; then
        git clone https://github.com/nu-slab/dotfiles.git ${DOTDIR}
    elif has "curl" || has "wget"; then
        TARBALL="https://github.com/nu-slab/dotfiles/archive/main.tar.gz"
        if has "curl"; then
            curl -L ${TARBALL} -o main.tar.gz
        else
            wget ${TARBALL}
        fi
        tar -zxf main.tar.gz
        rm -rf main.tar.gz
        mv -rf dotfiles-main "${DOTDIR}"
    else
        echo "curl or wget or git required"
        exit 1
    fi
else
    echo "dotfiles already exists"
    exit 1
fi

cd ${DOTDIR}/.dotfiles/script

./backup.sh
./uninstall.sh
./install.sh

