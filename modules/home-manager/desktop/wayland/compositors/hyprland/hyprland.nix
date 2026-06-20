{ config, self, ... }:
let
  collectFiles =
    dirPath: prefix:
    let
      entries = builtins.readDir dirPath;
      processEntry =
        name: type:
        let
          fullPath = dirPath + "/${name}";
          targetName = prefix + "/${name}";
        in
        if type == "directory" then
          collectFiles fullPath targetName
        else if type == "regular" then
          [
            {
              name = targetName;
              value = {
                source = fullPath;
              };
            }
          ]
        else
          [ ];
    in
    builtins.foldl' (acc: name: acc ++ (processEntry name entries.${name})) [ ] (
      builtins.attrNames entries
    );
in
{
  wayland.windowManager.hyprland.systemd.enable = false;

  xdg.configFile = (builtins.listToAttrs (collectFiles ./hypr "hypr"));
}
