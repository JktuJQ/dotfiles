{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zip
    unzip

    unrar

    xz
    zstd
    bzip2
    gzip

    _7zz
  ];
}
