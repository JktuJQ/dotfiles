{
  description = "Nix development environment with nil (LSP), nixfmt, nixpkgs-fmt, deadnix, statix; for writing Nix expressions and modules";

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
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            nil
            nixfmt
            deadnix
            statix
          ];

          shellHook = ''
            echo -e "\e[36m\e[0m Nix environment ready"
          '';
        };
      }
    );
}
