{
  programs.imv = {
    enable = true;
    settings = {
      options = {
        scale_mode = "fit";
      };
      aliases = {
        q = "quit";
        n = "select_rel 1";
        p = "select_rel -1";
        f = "fullscreen";
      };
    };
  };
}
