{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        settings = {
            user = {
                name = "jktujq";
                email = "odmamontov@gmail.com";
            };
            init = {
                defaultBranch = "main";
            };
        };
    };
}
