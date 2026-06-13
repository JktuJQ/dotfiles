{ config, self, ... }:
let
    collectFiles = dirPath: prefix:
        let
            entries = builtins.readDir dirPath;
            processEntry = name: type:
                let
                    fullPath = dirPath + "/${name}";
                    targetName = prefix + "/${name}";
                in
                    if type == "directory" then
                        collectFiles fullPath targetName
                    else if type == "regular" then
                        [ { name = targetName; value = { source = fullPath; }; } ]
                    else
                        [ ];
        in
            builtins.foldl' (acc: name: acc ++ (processEntry name entries.${name})) [] (builtins.attrNames entries);

    colors = config.lib.stylix.colors;
in {
    xdg.configFile = (builtins.listToAttrs (collectFiles (self + "/external/hypr") "hypr")) // {
        "hypr/variables.lua".text = ''
            return {
                mainMod = "SUPER",
            }
        '';
        "hypr/colors.lua".text = ''
            return {
                background = "${colors.base00}",
                foreground = "${colors.base05}",
                active = "${colors.base0D}",
                inactive = "${colors.base02}",
                urgent = "${colors.base08}",
            }
        '';
    };
    stylix.targets.hyprland.enable = false;
}
