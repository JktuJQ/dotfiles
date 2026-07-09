{
  description = "LaTeX development environment with texlive-full, texlab";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs =
    {
      self,
      flake-utils,
      nixpkgs,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShellNoCC {
          packages = with pkgs; [
            texlive.combined.scheme-full
            texlab
          ];
          shellHook = ''
            echo -e "\e[33m∑\e[0m LaTeX environment ready"
          '';
        };
      }
    );
}
