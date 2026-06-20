{ lib }:
let
  collectConfigFiles =
    {
      path,
      prefix,
      extra ? { },
    }:
    let
      entries = builtins.readDir path;
      processEntry =
        name: type:
        let
          fullPath = path + "/${name}";
          targetName = prefix + "/${name}";
        in
        if type == "directory" then
          collectConfigFiles {
            path = fullPath;
            prefix = targetName;
            extra = extra;
          }
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
      files = builtins.foldl' (acc: name: acc ++ (processEntry name entries.${name})) [ ] (
        builtins.attrNames entries
      );
      attrs = builtins.listToAttrs files;
    in
    attrs // extra;
in
{
  inherit collectConfigFiles;
}
