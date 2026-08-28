{ config, lib, ... }:
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

  home.file = {
    ".config/fish/conf.d/zzz-fzf-bindings.fish" = lib.mkIf config.programs.fish.enable {
      text = ''
        function fish_user_key_bindings
          bind -M insert -e ctrl-t
          bind -M insert -e ctrl-r
          bind -M insert -e alt-c
          bind -M insert -e ctrl-v

          bind -M insert ctrl-alt-c fzf-cd-widget
          bind -M insert ctrl-alt-h fzf-history-widget
          bind -M insert ctrl-alt-v _fzf_search_variables
        end
        fish_user_key_bindings
      '';
    };
  };
}
