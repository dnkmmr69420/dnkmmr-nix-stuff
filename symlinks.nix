{ config, pkgs, lib, ... }:

{
# Creates symlinks so you can go to these directories easier. Use the actual location when writing scripts because not everyone (most people) use this module on nixos.
  systemd.tmpfiles.rules = [
    "L /sw - - - - /run/current-system/sw"
    "L /nix/nix-profile - - - - /nix/var/nix/profiles/default"
  ];

}
