{ nixosModulesDir, ... }:
{
  imports = [
    (nixosModulesDir + "/nix.nix")

    (nixosModulesDir + "/system/boot.nix")
    (nixosModulesDir + "/system/locale.nix")
    (nixosModulesDir + "/system/dbus.nix")

    (nixosModulesDir + "/hardware/disks.nix")
    (nixosModulesDir + "/hardware/battery.nix")

    (nixosModulesDir + "/peripherals/seatd.nix")
    (nixosModulesDir + "/peripherals/audio.nix")
    (nixosModulesDir + "/peripherals/video.nix")

    (nixosModulesDir + "/networking/network-manager.nix")
    (nixosModulesDir + "/networking/bluetooth.nix")
    (nixosModulesDir + "/networking/openssh.nix")

    (nixosModulesDir + "/desktop/xdg.nix")
    (nixosModulesDir + "/desktop/wayland/regreet.nix")
    (nixosModulesDir + "/desktop/wayland/compositors/hyprland.nix")
    (nixosModulesDir + "/desktop/wayland/utils/hyprlock.nix")
  ];
}
