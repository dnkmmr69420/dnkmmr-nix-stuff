{ config, pkgs, ... }:

{
  environment.sessionVariables = {
    PATH = "/usr/local/bin:$PATH";
  };
}
