{ inputs }:
let
  lib = inputs.nixpkgs.lib;

  dir = ./.;
  entries = builtins.readDir dir;

  overlayFiles = lib.filterAttrs (
    name: type: type == "regular" && name != "default.nix" && lib.hasSuffix ".nix" name
  ) entries;

  overlays = map (name: import (dir + "/${name}") { inherit inputs; }) (
    builtins.attrNames overlayFiles
  );
in
lib.composeManyExtensions overlays
