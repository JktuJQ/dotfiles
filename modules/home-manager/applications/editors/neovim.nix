{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    sideloadInitLua = true;
  };
  xdg.configFile."nvim".source = pkgs.fetchFromGitHub {
    owner = "JktuJQ";
    repo = "nvim";
    rev = "main";
    sha256 = "sha256-XGYI7Cq6wQf06uhZYcVi+eGukE9Dmi3ocM+nYh734Ms=";
  };

  stylix.targets.neovim.enable = false;

  home.sessionVariables.EDITOR = "nvim";
}
