{
  description = "Rust development environment (customizable channel) with rust-analyzer, cargo, clippy, rustfmt";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      fenix,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        rustChannel = "stable"; # "beta", "nightly"

        rust = fenix.packages.${system}.${rustChannel};
        toolchain = rust.toolchain;
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            toolchain
            openssl
            pkg-config
            cargo-deny
            cargo-edit
            cargo-watch

            rust.rust-analyzer
          ];

          env = {
            RUST_SRC_PATH = "${toolchain}/lib/rustlib/src/rust/library";
          };

          shellHook = ''
            echo -e "\e[31m󱘗\e[0m Rust (${rustChannel}) environment ready"
          '';
        };
      }
    );
}
