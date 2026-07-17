{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;

    config = {
      profile = "high-quality";
      cache = true;
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
