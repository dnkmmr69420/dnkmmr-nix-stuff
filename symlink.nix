{ pkgs, ... }:

let
  symlinkScript = pkgs.writeScript "create-symlinks" ''
    #!/usr/bin/env bash
    ln -sf /nix/var/nix/profiles/default /nix/nix-profile
    ln -sf /run/current-system/sw /sw
    ln -sf /run/current-system/sw/bash /bin/bash
    
  '';
in
{
  environment.systemPackages = [ symlinkScript ];

  systemd.services.create-symlinks = {
    script = "${pkgs.create-symlinks}/bin/create-symlinks";
    wantedBy = [ "multi-user.target" ];
  };
}
