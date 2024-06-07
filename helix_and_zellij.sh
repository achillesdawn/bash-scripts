#!/bin/bash

function check_if_ln_exists() {
    if [ -h "$1" ]; then
        echo "symlink exists, removing..."
        rm "$1"
    else
        echo "symlink not found, continuing..."
    fi
}


function install_helix() {
    local VERSION=24.03
    local FILENAME=helix-24.03-x86_64-linux
    local TARNAME=${FILENAME}.tar.xz

    cd /usr/local || exit
    mkdir helix

    cd helix || exit

    wget https://github.com/helix-editor/helix/releases/download/${VERSION}/$TARNAME

    tar -xf $TARNAME

    rm $TARNAME

    cd $FILENAME || exit

    check_if_ln_exists /usr/local/bin/hx

    ln -sr ./hx /usr/local/bin
}

function install_zellij() {
    local VERSION=v0.40.1
    local FILENAME=zellij-aarch64-unknown-linux-musl
    local TARNAME=${FILENAME}.tar.gz

    cd /usr/local || exit
    mkdir zellij

    cd zellij || exit

    wget https://github.com/zellij-org/zellij/releases/download/${VERSION}/$TARNAME

    tar -xf $TARNAME

    rm $TARNAME

    cd $FILENAME || exit

    check_if_ln_exists /usr/local/bin/zellij

    ln -sr ./zellij /usr/local/bin
}

if [ ! -d /usr/local/helix ]; then
    install_helix
fi

if [ ! -d /usr/local/zellij ]; then
    install_zellij
fi