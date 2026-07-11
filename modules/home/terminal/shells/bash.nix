{ lib, ... }:
{
  programs.bash = {
    enable = true;
  };
  programs.starship.enableBashIntegration = false;

  home.sessionVariables.SHELL = lib.mkDefault "bash";
}
