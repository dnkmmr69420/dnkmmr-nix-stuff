{ config, pkgs, lib, ... }:

{
  systemd.tmpfiles.rules = [
    {
      name = "my-tmpfile";
      content = ''
        L /run/current-system/sw /sw
        L /nix/var/nix/profiles/default /nix/nix-profile
        L /run/current-system/sw/bin/bash /bin/bash
      '';
    }
  ];
}
