{ config, pkgs, lib, ... }:
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

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink
    (config.home.homeDirectory + "/Projects/nvim");
  /* = pkgs.fetchFromGitHub {
    owner = "JktuJQ";
    repo = "nvim";
    rev = "main";
    sha256 = lib.fakeSha256;
  }; */

  stylix.targets.neovim.enable = false;

  home.sessionVariables.EDITOR = "nvim";
}
