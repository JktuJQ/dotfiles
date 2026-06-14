{ username, ... }:
{
    programs.firefox.enable = true;

    stylix.targets.firefox.profileNames = [ username ];

    home.sessionVariables.BROWSER = "firefox";
}
