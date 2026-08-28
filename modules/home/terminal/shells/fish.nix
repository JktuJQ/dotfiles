{ pkgs, config, ... }:
{
  programs.fish = {
    enable = true;

    plugins = [
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
      {
        name = "colored-man-pages";
        src = pkgs.fishPlugins.colored-man-pages.src;
      }
    ];

    interactiveShellInit = ''
      set fish_greeting
      fastfetch

      fish_vi_key_bindings
      bind -M insert -e alt-v
      bind -M insert ctrl-alt-e edit_command_buffer
    '';
  };

  home.sessionVariables.SHELL = "fish";
}
