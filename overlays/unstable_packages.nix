{ inputs }:
let
  packagesFromUnstable = [
    "codex"
    # "neovim"
    # "kitty"
    # "yazi"
  ];
in
final: prev:
let
  unstable = import inputs.nixpkgs-unstable {
    system = prev.stdenv.hostPlatform.system;
    config = prev.config or { };
  };
in
builtins.listToAttrs (
  map (name: {
    inherit name;
    value = unstable.${name};
  }) packagesFromUnstable
)
