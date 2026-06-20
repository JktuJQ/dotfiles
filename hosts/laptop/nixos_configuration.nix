{ self, ... }:
let
  importPrefix = self + "/modules/nixos";
in
{
  imports = [
    (importPrefix + "/nix.nix")

    (importPrefix + "/boot.nix")

    (importPrefix + "/locale.nix")

    (importPrefix + "/battery.nix")

    (importPrefix + "/audio.nix")
    (importPrefix + "/video.nix")

    (importPrefix + "/networking.nix")
    (importPrefix + "/bluetooth.nix")
    (importPrefix + "/openssh.nix")
    (importPrefix + "/dbus.nix")

    (importPrefix + "/desktop/xdg.nix")
    (importPrefix + "/desktop/wayland/regreet.nix")
    (importPrefix + "/desktop/wayland/hyprland.nix")
    (importPrefix + "/desktop/wayland/hyprlock.nix")
  ];
}
