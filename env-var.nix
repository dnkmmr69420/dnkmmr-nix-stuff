{ config, pkgs, ... }:

{
  environment.sessionVariables = {
    PATH = "$HOME/.local/bin:$HOME/bin:/usr/local/bin:/usr/bin:/bin:$PATH";
    XDG_DATA_DIRS = "$HOME/.local/share:/usr/local/share:/usr/share:$XDG_DATA_DIRS";
  };
}
