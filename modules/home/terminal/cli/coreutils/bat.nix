{
  programs.bat.enable = true;

  home.shellAliases = {
    cat = "bat --style=plain --paging=never";
    catp = "bat --style=plain --paging=always";
  };
}
