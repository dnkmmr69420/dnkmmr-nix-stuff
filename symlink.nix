{ pkgs, ... }:

let
  symlinkScript = pkgs.writeScript "create-symlinks" ''
    #!/usr/bin/env bash
    ln -sf /path/to/target /path/to/destination
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
