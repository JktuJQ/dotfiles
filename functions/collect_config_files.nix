{ lib }:
let
  collectFilesRec =
    { path, prefix }:
    let
      entries = builtins.readDir path;
      processEntry =
        name: type:
        let
          fullPath = path + "/${name}";
          targetName = prefix + "/${name}";
        in
        if type == "directory" then
          collectFilesRec {
            path = fullPath;
            prefix = targetName;
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
    in
    builtins.foldl' (acc: name: acc ++ (processEntry name entries.${name})) [ ] (
      builtins.attrNames entries
    );
in
{
  collectConfigFiles =
    {
      path,
      prefix,
      extra ? { },
    }:
    let
      allFiles = collectFilesRec {
        path = path;
        prefix = prefix;
      };
    in
    builtins.listToAttrs allFiles // extra;
}
