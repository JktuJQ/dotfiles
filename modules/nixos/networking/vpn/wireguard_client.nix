{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.wireguard-tools ];
  programs.amnezia-vpn.enable = true;
}
