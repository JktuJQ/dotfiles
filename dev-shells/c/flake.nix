{
  description = "C development environment with gcc, gdb, make, cmake, valgrind; clangd and clang-format included";

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
            gcc
            gdb
            make
            cmake
            valgrind

            clang-tools
          ];
          shellHook = ''
            echo -e "\e[36m\e[0m C (gcc) environment ready"
          '';
        };
      }
    );
}
