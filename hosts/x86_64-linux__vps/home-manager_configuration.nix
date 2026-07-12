{
  inputs,
  pkgs,
  lib,
  homeModulesDir,
  ...
}:
let
  allUsers = {
    admin = {
      systemSettings = {
        extraGroups = [ "wheel" ];
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC8iPBGPTjWOLbKCdMji5l6UWxLvxqzYLrFfI2HJ0e6N odmamontov@gmail.com"
        ];
      };
      homeSettings = {
        imports = [
          (homeModulesDir + "/terminal/cli/git.nix")
          (homeModulesDir + "/terminal/cli/curl.nix")
          (homeModulesDir + "/terminal/cli/btop.nix")

          (homeModulesDir + "/applications/editors/vim.nix")
        ];
        home.sessionVariables = {
          #EDITOR = "vim";
        };
      };
    };
  };
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  environment.systemPackages = with pkgs; [ home-manager ];

  users.users = builtins.mapAttrs (
    name: cfg:
    {
      initialPassword = name;
      isNormalUser = true;
      home = "/home/${name}";
    }
    // cfg.systemSettings
  ) allUsers;

  home-manager.users = builtins.mapAttrs (
    name: cfg:
    lib.mkMerge [
      {
        home = {
          username = name;
          homeDirectory = "/home/${name}";
          stateVersion = "26.05";
        };
      }
      cfg.homeSettings
    ]
  ) allUsers;

  home-manager.backupFileExtension = "backup";
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
}
