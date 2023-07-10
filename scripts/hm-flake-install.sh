#!/usr/bin/env bash

if (( $EUID != 0 )); then
    echo "Must be ran as root"
    exit 1
fi
rm -rf /etc/home-manager
nix run home-manager/master -- init --switch
mv /root/.config/home-manager /etc/home-manager
ln -s /etc/home-manager /root/.config/home-manager

