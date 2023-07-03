{ config, pkgs, ... }:

{
  environment.sessionVariables = {
    PATH = "$HOME/.local/bin:/usr/bin:/usr/local/bin:$PATH";
    XDG_DATA_DIRS = "$HOME/.local/share:/usr/share:/usr/local/share:$XDG_DATA_DIRS";
  };
}
