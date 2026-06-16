{ username, pkgs, ... }:
let
    extensionUrl = extId: "https://addons.mozilla.org/firefox/downloads/latest/${extId}/latest.xpi";
in {
    programs.firefox = {
        enable = true;
        policies = {
            ExtensionSettings = {
                "jid1-MnnxcxisBPnSXQ@jetpack" = {
                    install_url = extensionUrl "privacy-badger17";
                    installation_mode = "force_installed";
                };
                "uBlock0@raymondhill.net" = {
                    install_url = extensionUrl "ublock-origin";
                    installation_mode = "force_installed";
                };
                "sponsorBlocker@ajay.app" = {
                    install_url = extensionUrl "sponsorblock";
                    installation_mode = "force_installed";
                };

                "vimium-c@gdh1995.cn" = {
                    install_url = extensionUrl "vimium-c";
                    installation_mode = "force_installed";
                };

                "{2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c}" = {
                    install_url = extensionUrl "search_by_image";
                    installation_mode = "force_installed";
                };

                "{8446b178-c865-4f5c-8ccc-1d7887811ae3}" = {
                    install_url = extensionUrl "catppuccin-mocha-lavender-git";
                    installation_mode = "force_installed";
                };
            };
        };
        profiles.${username} = {
            id = 0;
            name = username;
            isDefault = true;
            settings = {
                "layout.css.prefers-color-scheme.content-override" = 0;
                "ui.systemUsesDarkTheme" = 1;
                "browser.translations.enable" = false;
                "browser.translations.automaticallyPopup" = false;
                "toolkit.telemetry.enabled" = false;
                "datareporting.healthreport.uploadEnabled" = false;
                "extensions.pocket.enabled" = false;
                "browser.newtabpage.enabled" = false;
                "browser.startup.page" = 3;
                "browser.privatebrowsing.vpnpromourl" = "";
                "browser.shell.checkDefaultBrowser" = false;
                "browser.theme.dark-private-windows" = true;
                "extensions.activeThemeID" = "{8446b178-c865-4f5c-8ccc-1d7887811ae3}";
            };
            search = {
                force = true;
                default = "google";
                privateDefault = "google";
                engines = {
                    "google".metaData.alias = "@g";
                    "Nix Packages" = {
                        urls = [{
                            template = "https://search.nixos.org/packages";
                            params = [
                                { name = "type"; value = "packages"; }
                                { name = "query"; value = "{searchTerms}"; }
                            ];
                        }];
                        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                        definedAliases = [ "@np" ];
                    };
                    "Nix Options" = {
                        urls = [{
                            template = "https://search.nixos.org/options";
                            params = [
                                { name = "type"; value = "options"; }
                                { name = "query"; value = "{searchTerms}"; }
                            ];
                        }];
                        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                        definedAliases = [ "@no" ];
                    };
                };
            };
        };
    };

    stylix.targets.firefox.enable = false;

    home.sessionVariables.BROWSER = "firefox";
}
