{
  description = "NixOS configuration with home-manager";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    inputs:
    let
      lib = inputs.nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        laptop =
          let
            system = "x86_64-linux";
            hostName = "laptop";
          in
          lib.nixosSystem {
            inherit system;
            modules = [ ./hosts/laptop/configuration.nix ];
            specialArgs = {
              self = inputs.self;
              hostName = hostName;
              inherit inputs;
            };
          };
      };

      templates = import ./dev-shells;
    }
    // inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = inputs.nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            nil
            nixfmt
            deadnix
            statix
          ];
        };
      }
    );
}
