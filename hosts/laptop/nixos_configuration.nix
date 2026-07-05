{ self, ... }:
let
  importPrefix = self + "/modules/nixos";
in
{
  imports = [
    (importPrefix + "/nix.nix")

    (importPrefix + "/system/boot.nix")
    (importPrefix + "/system/locale.nix")
    (importPrefix + "/system/dbus.nix")

    (importPrefix + "/hardware/disks.nix")
    (importPrefix + "/hardware/battery.nix")

    (importPrefix + "/peripherals/seatd.nix")
    (importPrefix + "/peripherals/audio.nix")
    (importPrefix + "/peripherals/video.nix")

    (importPrefix + "/networking/network-manager.nix")
    (importPrefix + "/networking/bluetooth.nix")
    (importPrefix + "/networking/openssh.nix")

    (importPrefix + "/desktop/xdg.nix")
    (importPrefix + "/desktop/wayland/regreet.nix")
    (importPrefix + "/desktop/wayland/compositors/hyprland.nix")
    (importPrefix + "/desktop/wayland/utils/hyprlock.nix")
  ];
}
