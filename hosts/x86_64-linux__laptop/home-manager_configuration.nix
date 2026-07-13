{ inputs, pkgs, assetsDir, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  environment.systemPackages = with pkgs; [ home-manager ];

  home-manager.extraSpecialArgs = { inherit assetsDir; };
  home-manager.backupFileExtension = "backup";
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
}
