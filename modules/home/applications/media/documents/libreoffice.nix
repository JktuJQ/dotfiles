{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libreoffice-still

    hunspell
    hunspellDicts.en_US
    hunspellDicts.ru_RU
  ];
}
