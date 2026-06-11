{ config, pkgs, ... }:

{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        vimAlias = true;
	sideloadInitLua = true;
    };

    xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/dotfiles/home-manager/nvim";
}
