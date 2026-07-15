username:
{
  config,
  pkgs,
  homeModulesDir,
  secretsDir,
  ...
}:
{
  users.users.${username} = {
    isNormalUser = true;
    home = "/home/${username}";
    extraGroups = [ "wheel" ];
    initialPassword = username;

    openssh.authorizedKeys.keys = [
      (import (secretsDir + "ssh_keys.nix")).users.jktujq
    ];
  };

  home-manager.users.${username} = {
    imports = [
      (homeModulesDir + "terminal/cli/git.nix")
      (homeModulesDir + "terminal/cli/curl.nix")
      (homeModulesDir + "terminal/cli/btop.nix")

      (homeModulesDir + "applications/editors/vim.nix")
    ];
    home = {
      stateVersion = "26.05";

      username = username;
      homeDirectory = "/home/${username}";
      #sessionVariables.EDITOR = "vim";
    };
  };
}
