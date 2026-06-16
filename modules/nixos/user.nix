{ config, lib, pkgs, ... }:
let
    cfg = config.my.user;
in {
    options.my.user = {
        name = lib.mkOption {
            type = lib.types.str;
            default = "jktujq";
            description = "User name";
        };
        homeDir = lib.mkOption {
            type = lib.types.str;
            default = "/home/${cfg.name}";
            description = "User home directory";
        };
        shell = lib.mkOption {
            type = lib.types.package;
            default = pkgs.bash;
            description = "Default shell for the user";
        };
    };

    config = {
        users.users.${cfg.name} = {
            isNormalUser = true;
            home = cfg.homeDir;
            shell = cfg.shell;
            extraGroups = [ "wheel" "networkmanager" ];
            initialPassword = "nixos";
        };
    };
}
