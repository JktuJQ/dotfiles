{ self, pkgs, ... }:

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
  xdg.configFile."nvim".source = ./nvim;

  stylix.targets.neovim.enable = false;

  home.sessionVariables.EDITOR = "nvim";
}
