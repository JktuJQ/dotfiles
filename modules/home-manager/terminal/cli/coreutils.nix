{ pkgs, ... }:
{
  programs.bat.enable = true;
  home.packages = with pkgs; [
    eza
    fzf
    zoxide
    fd
    ripgrep
  ];

  home.shellAliases = {
    cd = "z";
    ls = "eza --icons --color=always --group-directories-first";
    tree = "eza --tree --icons --color=always --group-directories-first";
    cat = "bat --style=plain --paging=never";
    catp = "bat --style=plain --paging=always";
    grep = "rg";
    fdf = "fd --type f";
    fdd = "fd --type d";
    fzfr = "fzf --height 40% --border --reverse --preview 'bat --style=plain --color=always {}'";
  };
}
