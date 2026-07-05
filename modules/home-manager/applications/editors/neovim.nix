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
      lua-language-server
    ];
  };
  xdg.configFile."nvim".source = pkgs.fetchFromGitHub {
    owner = "JktuJQ";
    repo = "nvim";
    rev = "main";
    sha256 = "sha256-tOVzB65nAWrhQbdnUEmp3KdSxXPAY8HQizfGuB/5AZo=";
  };

  stylix.targets.neovim.enable = false;

  home.sessionVariables.EDITOR = "nvim";
}
