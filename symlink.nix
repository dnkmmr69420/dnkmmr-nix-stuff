{ pkgs, ... }:

let
  symlinkScript = pkgs.writeScript "create-symlinks" ''
    #!/usr/bin/env bash
    ln -sf /nix/var/nix/profiles/default /nix/nix-profile
    ln -sf /run/current-system/sw /sw
    ln -sf /run/current-system/sw/bin/bash /bin/bash
  '';
in
{
  environment.systemPackages = [ symlinkScript ];

  systemd.services.create-symlinks = {
    description = "Create symlinks on boot";
    after = [ "local-fs.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.writeText "create-symlinks.sh" symlinkScript}";
      User = "root";
      Group = "root";
    };
  };
}
