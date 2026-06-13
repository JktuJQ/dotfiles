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

    outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs:
        let
            system = "x86_64-linux";
            lib = nixpkgs.lib;
            pkgs = nixpkgs.legacyPackages.${system};
        in {
            nixosConfigurations.nixos = lib.nixosSystem {
                inherit system;
                modules = [
                    (self + "/hosts/nixos/configuration.nix")
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.jktujq = import ./home-manager/jktujq.nix;
                        home-manager.extraSpecialArgs = { inherit inputs; self = self; };
                    }
                    stylix.nixosModules.stylix {
                        stylix = {
                            enable = true;
                            base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
                            autoEnable = true;
                        };
                    }
                ];
                specialArgs = { inherit inputs; self = self; };
            };
        };
}
