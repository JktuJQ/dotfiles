{ config, pkgs, ... }:
let
  tuiPaddingWatcher = pkgs.writeText "kitty-tui-padding" ''
    from kitty.fast_data_types import add_timer, get_boss

    EDGES = ("left", "top", "right", "bottom")
    POLL_INTERVAL = 0.1
    _saved_padding = {}
    _timer_started = False


    def _update_padding(timer_id):
        boss = get_boss()
        if boss is None:
            return

        windows = tuple(boss.window_id_map.values())
        live_ids = {window.id for window in windows}
        for window_id in tuple(_saved_padding):
            if window_id not in live_ids:
                del _saved_padding[window_id]

        changed_tabs = {}
        for window in windows:
            if window.destroyed or window.overlay_parent is not None:
                continue

            alternate = window.screen.is_using_alternate_linebuf()
            if alternate and window.id not in _saved_padding:
                _saved_padding[window.id] = tuple(
                    getattr(window.padding, edge) for edge in EDGES
                )
                padding = (0, 0, 0, 0)
            elif not alternate and window.id in _saved_padding:
                padding = _saved_padding.pop(window.id)
            else:
                continue

            for edge, value in zip(EDGES, padding):
                window.patch_edge_width("padding", edge, value)
            tab = window.tabref()
            if tab is not None:
                changed_tabs[tab.id] = tab

        for tab in changed_tabs.values():
            tab.relayout()


    def on_load(boss, data):
        global _timer_started
        if not _timer_started:
            add_timer(_update_padding, POLL_INTERVAL, True)
            _timer_started = True
  '';
in
{
  programs.kitty = {
    enable = true;
    settings = {
      term = "xterm-256color";
      shell = config.home.sessionVariables.SHELL;
      window_padding_width = 10;
      window_padding_height = 5;
      watcher = "${tuiPaddingWatcher}";
      hide_window_decorations = "yes";
      scrollback_lines = 10000;
      cursor_shape = "block";
      cursor_blink_interval = 0;
    };
    keybindings = {
      "ctrl+y" = "copy_or_interrupt";
      "ctrl+p" = "paste_from_clipboard";
    };
  };

  home.sessionVariables.TERMINAL = "kitty";
}
