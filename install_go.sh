#!/bin/bash

function install_go() {

    local GO_VERSION=1.22.4

    cd || exit
    mkdir go
    cd go || exit
    wget https://go.dev/dl/go"${GO_VERSION}".linux-amd64.tar.gz
    rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.4.linux-amd64.tar.gz

    if ! grep -q /usr/local/go/bin /etc/profile; then
        echo "PATH=$PATH:/usr/local/go/bin" >> /etc/profile 
    fi    
}

install_go