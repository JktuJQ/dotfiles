{
  programs.imv = {
    enable = true;
    settings = {
      options = {
        overlay = false;
        scale_mode = "fit";
        slideshow_delay = 5;
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
