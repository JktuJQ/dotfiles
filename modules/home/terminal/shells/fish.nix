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

      fzf_configure_bindings --directory=\cd --history=\ch --variables=\cr
    '';
  };

  home.sessionVariables.SHELL = "fish";
}
