username:
{
  config,
  pkgs,
  homeModulesDir,
  assetsDir,
  ...
}:
{
  users.users.${username} = {
    isNormalUser = true;
    home = "/home/${username}";
    extraGroups = [
      "wheel"
      "audio"
      "video"
      "networkmanager"
    ];

    hashedPasswordFile = config.age.secrets."${username}_hashed_password".path;
  };

  home-manager.users.${username} = {
    imports = [
      (homeModulesDir + "terminal/cli/direnv.nix")

      (homeModulesDir + "terminal/cli/bat.nix")
      (homeModulesDir + "terminal/cli/eza.nix")
      (homeModulesDir + "terminal/cli/fd.nix")
      (homeModulesDir + "terminal/cli/fzf.nix")
      (homeModulesDir + "terminal/cli/ripgrep.nix")
      (homeModulesDir + "terminal/cli/btop.nix")
      (homeModulesDir + "terminal/cli/git.nix")
      (homeModulesDir + "terminal/cli/curl.nix")

      (homeModulesDir + "terminal/cli/colors.nix")
      (homeModulesDir + "terminal/cli/fastfetch.nix")

      (homeModulesDir + "terminal/shells/starship.nix")
      (homeModulesDir + "terminal/shells/bash.nix")
      (homeModulesDir + "terminal/shells/fish.nix")

      (homeModulesDir + "applications/terminals/kitty.nix")
      #(homeModulesDir + "applications/terminals/alacritty.nix")

      #(homeModulesDir + "applications/editors/vim.nix")
      (homeModulesDir + "applications/editors/neovim.nix")

      (homeModulesDir + "applications/file_managers/yazi.nix")
      (homeModulesDir + "applications/file_managers/thunar.nix")

      (homeModulesDir + "applications/browsers/firefox.nix")

      (homeModulesDir + "applications/media/images/imv.nix")
      (homeModulesDir + "applications/media/videos/mpv.nix")
      (homeModulesDir + "applications/media/documents/zathura.nix")

      (homeModulesDir + "desktop/xdg.nix")
      (homeModulesDir + "desktop/udiskie.nix")

      (homeModulesDir + "desktop/wayland/uwsm.nix")

      (homeModulesDir + "desktop/wayland/compositors/hyprland.nix")

      (homeModulesDir + "desktop/wayland/utils/wlogout.nix")
      (homeModulesDir + "desktop/wayland/utils/hypridle.nix")
      (homeModulesDir + "desktop/wayland/utils/hyprlock.nix")
      (homeModulesDir + "desktop/wayland/utils/hyprshot.nix")
      (homeModulesDir + "desktop/wayland/utils/hyprpicker.nix")

      (homeModulesDir + "desktop/wayland/ui/waybar.nix")

      #(homeModulesDir + "desktop/wayland/launchers/anyrun.nix")
      (homeModulesDir + "desktop/wayland/launchers/rofi.nix")

      #(homeModulesDir + "desktop/wayland/notifications/libnotify.nix")
      (homeModulesDir + "desktop/wayland/notifications/mako.nix")
      #(homeModulesDir + "desktop/wayland/notifications/swaync.nix")

      (homeModulesDir + "desktop/wayland/wallpapers/hyprpaper.nix")
      #(homeModulesDir + "desktop/wayland/wallpapers/awww.nix")
    ];

    home = {
      stateVersion = "26.05";

      username = username;
      homeDirectory = "/home/${username}";

      sessionVariables = {
        # SHELL = "fish";
        # TERMINAL = "kitty";
        # EDITOR = "nvim";
        # BROWSER = "firefox";
        # LAUNCHER = "rofi"
        # FILE_MANAGER = "thunar"
      };
    };
    home.file.".face".source = assetsDir + "avatar.png";
  };
}
