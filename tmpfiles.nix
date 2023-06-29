{ config, pkgs, lib, ... }:

{
  systemd.tmpfiles.rules = [
    "L /sw - - - - /run/current-system/sw"
    "L /nix/nix-profile - - - - /nix/var/nix/profiles/default"
    "L /bin/bash - - - - /run/current-system/sw/bin/bash"
  ];

}
