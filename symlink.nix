{ config, pkgs, ... }:

let
  symlinkService = {
    description = "Create symlinks on boot";
    after = [ "local-fs.target" ];
    wants = [ "network-online.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = ''
        ln -sf /nix/var/nix/profiles/default /nix/nix-profile
        ln -sf /run/current-system/sw /sw
        ln -sf /run/current-system/sw/bin/bash /bin/bash
      '';
      User = "root";
      Group = "root";
    };
  };
in
{
  systemd.services = {
    "create-symlinks" = symlinkService;
  };
}
