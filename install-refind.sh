#!/usr/bin/env bash

echo "enter sudo password"
sudo echo "launching nix-shell with packages for refind to install, type \"refind-install\" once you are in the shell.
sudo nix-shell -p refind efibootmgr
