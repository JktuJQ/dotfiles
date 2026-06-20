{ config, pkgs, ... }:
let
    greeterUser = "greeter";
in {
    users.users.${greeterUser} = {
        isNormalUser = false;
        home = "/var/lib/${greeterUser}";
        createHome = true;
        group = "greeter";
    };
    users.groups.greeter = {};

    security.pam.services.greetd = { };

    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                user = greeterUser;
            };
        };
    };

    programs.regreet.enable = true;
}
