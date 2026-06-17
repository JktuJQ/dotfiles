{ self, pkgs, ... }:
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
    xdg.configFile."nvim".source = (self + "/external/nvim");

    stylix.targets.neovim.enable = false;

    home.sessionVariables.EDITOR = "nvim";
}
