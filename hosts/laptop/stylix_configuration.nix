{ stylixModule, self, pkgs, ... }:
{
    imports = [ stylixModule.nixosModules.stylix ];

    stylix = {
        enable = true;
        image = (self + "/assets/wallpaper.jpg");
        polarity = "dark";
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
        fonts = {
            monospace = {
                package = pkgs.nerd-fonts.jetbrains-mono;
                name = "JetBrainsMono Nerd Font";
            };
            sansSerif = {
                package = pkgs.roboto;
                    name = "Roboto";
            };
            serif = {
                package = pkgs.roboto-slab;
                name = "Roboto Slab";
            };
            emoji = {
                package = pkgs.noto-fonts-color-emoji;
                name = "Noto Color Emoji";
            };
        };
        autoEnable = true;
    };
}
