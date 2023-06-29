{ config, pkgs, lib, ... }:

  systemd.tmpfiles.rules = [
    "L /run/current-system/sw - - - - /sw"
    "L /nix/var/nix/profiles/default - - - - /nix/nix-profile"
    "L /run/current-system/sw/bin/bash - - - - /bin/bash"
  ];
