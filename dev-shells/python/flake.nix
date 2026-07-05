{
  description = "Python development environment (customizable version) with pyright LSP, black, mypy, pytest";

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

        pythonVersion = "3.12"; # "3.12", "3.13"

        python = pkgs."python${builtins.replaceStrings [ "." ] [ "" ] pythonVersion}";
      in
      {
        devShells.default = pkgs.mkShellNoCC {
          venvDir = ".venv";

          packages = with pkgs; [
            python
            python.pkgs.pip
            python.pkgs.venvShellHook

            pyright
            python.pkgs.black
          ];

          postShellHook = ''
            venvVersionWarn() {
              local venvVersion
              venvVersion="$("$venvDir/bin/python" -c 'import platform; print(platform.python_version())')"
              if [[ "$venvVersion" != "${python.version}" ]]; then
                echo "⚠️  Python version mismatch: [$venvVersion (venv)] != [${python.version} (system)]"
                echo "   Delete '$venvDir' and reload to rebuild for version ${python.version}"
              fi
            }
            venvVersionWarn
            echo -e "\e[34m\e[0m Python (${pythonVersion}) environment ready"
          '';
        };
      }
    );
}
