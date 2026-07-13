{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;

    stdlib = ''
      direnv_layout_dir() {
        echo "$HOME/.cache/direnv/layouts/$(basename "$PWD")-$(md5sum - <<< "$PWD" | cut -d' ' -f1)"
      }
    '';

    config = {
      global = {
        hide_env_diff = true;
        log_format = "direnv: %s";
      };
    };
  };
}
