{
  programs.tmux = {
    enable = true;

    clock24 = true;
    mouse = true;
    terminal = "tmux-256color";
    shortcut = "b";

    extraConfig = ''
      unbind 'c'
      unbind 'n'
      unbind 'p'
      unbind 'l'
      unbind 'w'
      unbind 'f'
      unbind ','
      unbind '&'
      unbind '%'
      unbind 'x'
      unbind 'z'
      unbind 'q'
      unbind 'o'
      unbind '"'
      unbind '{'
      unbind '}'
      unbind 'Space'

      bind 'N' new-window
      bind 'R' command-prompt -p "New name:" "rename-window '%%'"
      bind 'Q' confirm-before -p "kill window #{window_name}?" kill-window
      bind '{' previous-window
      bind '}' next-window
      bind 'L' last-window
      bind 'W' choose-tree -w
      bind 'F' command-prompt -p "find window:" "find-window '%%'"

      bind 'q' confirm-before -p "kill pane #{pane_index}?" kill-pane
      bind '\' split-window -h
      bind '-' split-window -v
      bind 'h' select-pane -L
      bind 'j' select-pane -D
      bind 'k' select-pane -U
      bind 'l' select-pane -R
      bind 'H' swap-pane -U
      bind 'L' swap-pane -D
      bind 'Left' resize-pane -L 5
      bind 'Right' resize-pane -R 5
      bind 'Up' resize-pane -U 5
      bind 'Down' resize-pane -D 5
      bind 'f' resize-pane -Z
      bind 'n' display-panes
      bind '[' select-pane -U
      bind ']' select-pane -D
    '';
  };
}
