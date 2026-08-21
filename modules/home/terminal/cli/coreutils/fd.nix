{ pkgs, ... }:
{
  home.packages = [ pkgs.fd ];

  home.shellAliases = {
    find = "fd";
    findf = "fd --type f";
    findd = "fd --type d";
  };
}
