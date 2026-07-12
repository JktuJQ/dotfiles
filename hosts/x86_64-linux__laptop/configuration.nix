{
  imports = [
    ./hardware_configuration.nix
    ./disko_configuration.nix
    ./nixos_configuration.nix

    ./home-manager_configuration.nix

    ./stylix_configuration.nix

    ./agenix_configuration.nix
  ];

  system.stateVersion = "26.05";
}
