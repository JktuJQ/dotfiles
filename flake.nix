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
	
	self.submodules = true;
    };

    outputs = { self, nixpkgs, home-manager, stylix, ... }:
        let
            system = "x86_64-linux";
            lib = nixpkgs.lib;
        in {
            nixosConfigurations = builtins.mapAttrs
                (name: _: lib.nixosSystem {
                    inherit system;
                    modules = [ (self + "/hosts/${name}/configuration.nix") ];
                    specialArgs = {
                        inherit self;
                        hostName = name;

                        homeManagerModule = home-manager;
                        stylixModule = stylix;
                    };
                })
                (lib.filterAttrs (name: type: type == "directory")
                    (builtins.readDir (self + "/hosts")));
        };
}
