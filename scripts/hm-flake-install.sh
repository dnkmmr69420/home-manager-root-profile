#!/usr/bin/env bash

if (( $EUID != 0 )); then
    echo "Must be ran as root"
    exit 1
fi

mkdir -p /etc/home-manager
ln -s /etc/home-manager /root/.config/home-manager
nix run home-manager/master -- init --switch
