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
    xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink
        "${dotfilesDir}/external/nvim";

    stylix.targets.neovim.enable = false;
}
