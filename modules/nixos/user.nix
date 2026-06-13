{ config, lib, pkgs, ... }:
let
    cfg = config.my.user;
in {
    options.my.user = {
        name = lib.mkOption {
            type = lib.types.str;
            default = "jktujq";
        };
        homeDir = lib.mkOption {
            type = lib.types.str;
            default = "/home/${cfg.name}";
        };
    };

    config = {
        users.users.${cfg.name} = {
            isNormalUser = true;
            home = cfg.homeDir;
            extraGroups = [ "wheel" "networkmanager" ];
            initialPassword = "nixos";
        };
    };
}
