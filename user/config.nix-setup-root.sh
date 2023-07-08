#!/usr/bin/env bash

if (( $EUID != 0 )); then
    echo "Must be ran as root"
    exit 1
fi

if [[ -f /root/.config/nixpkgs/config.nix ]]
then
  echo "\'/root/.config/nixpkgs/config.nix\' already exists"
  exit 1
fi

mkdir -p /root/.config/nixpkgs
curl https://raw.githubusercontent.com/dnkmmr69420/dnkmmr-nix-stuff/main/user/config.nix -o /root/.config/nixpkgs/config.nix
