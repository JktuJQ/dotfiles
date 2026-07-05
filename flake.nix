{
  description = "NixOS configuration with home-manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

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
    };
}
