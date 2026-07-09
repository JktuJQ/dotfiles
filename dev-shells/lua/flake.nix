{
  description = "Lua development environment (customizable version) with luarocks, lua-language-server, stylua";

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

        luaVersion = "lua5_4"; # "lua5_1", "lua5_2", "lua5_3", "luajit"

        lua = pkgs.${luaVersion};
        luaLib = lua.pkgs;
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            lua
            luaLib.luarocks

            lua-language-server
            stylua
          ];

          shellHook = ''
            echo -e "\e[34m\e[0m Lua (${luaVersion}) environment ready"
          '';
        };
      }
    );
}
