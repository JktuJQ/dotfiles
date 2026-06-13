{ config, pkgs, dotfilesDir, ... }:
{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        vimAlias = true;
        sideloadInitLua = true;
        extraPackages = with pkgs; [
            nil
            lua-language-server
        ];
    };
    home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink
        "${dotfilesDir}/external/nvim";

    stylix.targets.neovim.enable = false;
}
