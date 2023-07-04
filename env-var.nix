{ config, pkgs, ... }:

{
  environment.sessionVariables = {
    PATH = "$HOME/.local/bin:$HOME/bin:/usr/local/bin:/usr/bin:/bin:$PATH";
  };
}
