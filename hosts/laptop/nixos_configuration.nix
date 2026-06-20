{ self, ... }:
{
    imports = [
        (self + "/modules/nixos/boot.nix")

        (self + "/modules/nixos/locale.nix")

        (self + "/modules/nixos/battery.nix")

        (self + "/modules/nixos/audio.nix")
        (self + "/modules/nixos/video.nix")

        (self + "/modules/nixos/networking.nix")
        (self + "/modules/nixos/openssh.nix")
        (self + "/modules/nixos/dbus.nix")

        (self + "/modules/nixos/desktop/xdg.nix")
        (self + "/modules/nixos/desktop/wayland/regreet.nix")
        (self + "/modules/nixos/desktop/wayland/hyprland.nix")
        (self + "/modules/nixos/desktop/wayland/hyprlock.nix")
    ];
}
