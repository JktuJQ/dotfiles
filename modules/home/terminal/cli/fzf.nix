{
  programs.fzf = {
    enable = true;

    defaultOptions = [
      "--height 40%"
      "--border"
      "--reverse"
      "--preview 'bat --style=plain --color=always {}'"
    ];
  };
}
