{
    description = "NixOS configuration with home-manager";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
        home-manager = {
            url = "github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs:
        let
            system = "x86_64-linux";
            lib = nixpkgs.lib;
        in {
            nixosConfigurations.nixos = lib.nixosSystem {
                inherit system;
                modules = [
                    ./hosts/nixos/configuration.nix
                    home-manager.nixosModules.home-manager
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.jktujq = import ./home-manager/jktujq.nix;
                        home-manager.extraSpecialArgs = { inherit inputs; self = self; };
                    }
                ];
                specialArgs = { inherit inputs; self = self; };
            };
        };
}
