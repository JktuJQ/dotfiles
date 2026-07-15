{ nixosModulesDir, ... }:
{
  imports = [
    (nixosModulesDir + "/nix.nix")

    (nixosModulesDir + "/system/boot.nix")
    (nixosModulesDir + "/system/users.nix")
    (nixosModulesDir + "/system/locale.nix")
    (nixosModulesDir + "/system/dbus.nix")

    (nixosModulesDir + "/networking/firewall.nix")
    (nixosModulesDir + "/networking/fail2ban.nix")

    (nixosModulesDir + "/networking/ssh/openssh.nix")
    (nixosModulesDir + "/networking/ssh/openssh-hardened.nix")

    (nixosModulesDir + "/networking/vpn/wireguard_server.nix")
  ];
}
