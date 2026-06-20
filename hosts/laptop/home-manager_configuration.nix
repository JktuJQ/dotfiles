{
  homeManagerModule,
  self,
  pkgs,
  lib,
  functions,
  ...
}:
let
  importPrefix = self + "/modules/home-manager";

  allUsers = {
    jktujq = {
      systemSettings = {
        extraGroups = [
          "wheel"
          "audio"
          "video"
          "networkmanager"
        ];
      };
      homeSettings = {
        imports = [
          (importPrefix + "/terminal/cli/coreutils.nix")
          (importPrefix + "/terminal/cli/git.nix")
          (importPrefix + "/terminal/cli/yazi.nix")
          (importPrefix + "/terminal/cli/colors.nix")
          (importPrefix + "/terminal/cli/fastfetch.nix")

          (importPrefix + "/terminal/shells/starship.nix")
          (importPrefix + "/terminal/shells/bash.nix")
          (importPrefix + "/terminal/shells/fish.nix")

          (importPrefix + "/applications/terminals/kitty.nix")
          #(importPrefix + "/applications/terminals/alacritty.nix")

          (importPrefix + "/applications/editors/neovim/neovim.nix")
          (importPrefix + "/applications/file_managers/thunar.nix")
          (importPrefix + "/applications/browsers/firefox.nix")
          (importPrefix + "/applications/media/images/imv.nix")
          (importPrefix + "/applications/media/videos/mpv.nix")

          (importPrefix + "/desktop/xdg.nix")

          (importPrefix + "/desktop/wayland/uwsm.nix")

          (importPrefix + "/desktop/wayland/compositors/hyprland/hyprland.nix")
          (importPrefix + "/desktop/wayland/utils/wlogout.nix")
          (importPrefix + "/desktop/wayland/utils/hypridle.nix")
          (importPrefix + "/desktop/wayland/utils/hyprlock.nix")
          (importPrefix + "/desktop/wayland/utils/hyprshot.nix")
          (importPrefix + "/desktop/wayland/ui/waybar.nix")
          (importPrefix + "/desktop/wayland/launchers/anyrun.nix")
          #(importPrefix + "/desktop/wayland/notifications/mako.nix")
          (importPrefix + "/desktop/wayland/notifications/swaync.nix")
          (importPrefix + "/desktop/wayland/wallpapers/hyprpaper.nix")
          #(importPrefix + "/desktop/wayland/wallpapers/awww.nix")
        ];
        home.sessionVariables = {
          SHELL = lib.mkForce "fish";
          # TERMINAL = "kitty";
          # EDITOR = "nvim";
          # BROWSER = "firefox";
          # LAUNCHER = "anyrun"
          # FILE_MANAGER = "thunar"
        };
      };
    };
  };
in
{
  imports = [ homeManagerModule.nixosModules.home-manager ];

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
        _module.args = {
          inherit self;
        };

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
  home-manager.extraSpecialArgs = {
    inherit functions;
  };
}
