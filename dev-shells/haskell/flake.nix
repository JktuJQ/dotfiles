{
  description = "Haskell development environment with customizable GHC version, cabal, haskell-language-server, ghcid, hlint";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        ghcVersion = "ghc"; # "ghc92", "ghc94", "ghc96", "ghc810"

        ghc = pkgs.haskell.packages.${ghcVersion}.ghc;
        hls = pkgs.haskell.packages.${ghcVersion}.haskell-language-server;
        cabal = pkgs.haskell.packages.${ghcVersion}.cabal-install;
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            ghc
            cabal
            hls
            haskellPackages.ghcid
            haskellPackages.hlint
          ];
          shellHook = ''
            echo -e "\e[35m\e[0m Haskell (${ghcVersion}) environment ready"
          '';
        };
      }
    );
}
