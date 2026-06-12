{ self, ... }:
{
    imports = [
        (self + "/hosts/nixos/hardware_configuration.nix")
        
        (self + "/modules/nixos/users/jktujq.nix")

        (self + "/modules/nixos/boot.nix")
        (self + "/modules/nixos/locale.nix")
        (self + "/modules/nixos/fonts.nix")
        (self + "/modules/nixos/networking.nix")

        (self + "/modules/nixos/services/openssh.nix")
    ];

    system.stateVersion = "26.05";
}
