{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    sideloadInitLua = true;
    extraPackages = with pkgs; [
      nil
      nixfmt
    ];
  };
  xdg.configFile."nvim".source = pkgs.fetchFromGitHub {
    owner = "JktuJQ";
    repo = "nvim";
    rev = "main";
    sha256 = "sha256-XIdnESRuXThu89hERZokUEXhct/q3d/drhrkThxTFqM=";
  };

  stylix.targets.neovim.enable = false;

  home.sessionVariables.EDITOR = "nvim";
}
