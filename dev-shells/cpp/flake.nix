{
  description = "C++ development environment with customizable compiler (gcc/clang), clangd, cmake, gdb, cppcheck, conan, vcpkg, doxygen, gtest, lcov";

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

        compiler = "gcc"; # "clang"

        stdenv = if compiler == "gcc" then pkgs.stdenv else pkgs.clangStdenv;
        extraTools =
          with pkgs;
          [
            cmake
            gdb
            clang-tools
            codespell
            conan
            cppcheck
            doxygen
            gtest
            lcov
            vcpkg
            vcpkg-tool

            clang-tools
          ]
          ++ (if pkgs.stdenv.hostPlatform.system == "aarch64-darwin" then [ ] else [ pkgs.gdb ]);
      in
      {
        devShells.default = pkgs.mkShell.override { stdenv = stdenv; } {
          packages = extraTools;
          shellHook = ''
            echo -e "\e[36m\e[0m C++ (${compiler}) environment ready"
          '';
        };
      }
    );
}
