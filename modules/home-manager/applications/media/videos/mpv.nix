{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;

    config = {
      profile = "high-quality";
      cache = true;
      cache-default = 4000000;
      ytdl-format = "bestvideo+bestaudio";
      save-position-on-quit = true;
    };

    scripts = with pkgs.mpvScripts; [
      uosc
      sponsorblock
      thumbfast
      autoload
    ];
  };
}
