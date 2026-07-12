{ pkgs, ... }:
{
  home.packages = [ pkgs.curl ];

  home.file.".curlrc".text = ''
    progress-bar
  '';
}
