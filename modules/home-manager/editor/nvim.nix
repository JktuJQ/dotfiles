{ config, pkgs, dotfilesDir, ... }:
{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        vimAlias = true;
        sideloadInitLua = true;
    };

    home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink
        "${dotfilesDir}/external/nvim";
}
