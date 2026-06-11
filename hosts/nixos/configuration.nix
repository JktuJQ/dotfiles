{
    config,
    pkgs,
    inputs,
    ...
}:

{
    imports = [
        ./hardware.nix
        ../../modules/system/boot.nix
        ../../modules/system/locale.nix
        ../../modules/system/networking.nix
        ../../modules/system/services/openssh.nix
        ../../modules/hardware/btrfs.nix
        ../../modules/users/jktujq.nix
    ];

    system.stateVersion = "26.05";
}
