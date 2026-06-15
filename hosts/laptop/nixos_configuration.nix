{ self, ... }:
{
    imports = [
        (self + "/modules/nixos/boot.nix")

        (self + "/modules/nixos/locale.nix")

        (self + "/modules/nixos/user.nix")
        (self + "/modules/nixos/networking.nix")

        (self + "/modules/nixos/services/openssh.nix")
        (self + "/modules/nixos/services/dbus.nix")

        (self + "/modules/nixos/desktop/xdg.nix")
        (self + "/modules/nixos/desktop/hyprland.nix")
    ];
}
