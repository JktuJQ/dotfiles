{
  programs.eza = {
    enable = true;
    icons = "auto";
    git = true;
    extraOptions = [ "--group-directories-first" "--color=always" ];
  };

  home.shellAliases = {
    ls = "eza";
    tree = "eza --tree";
  };
}
