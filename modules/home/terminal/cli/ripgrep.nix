{
  programs.ripgrep = {
    enable = true;
    arguments = [ "--smart-case" ];
  };

  home.shellAliases.grep = "rg";
}
