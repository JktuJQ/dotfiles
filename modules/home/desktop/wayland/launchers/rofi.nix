{
  config,
  pkgs,
  ...
}:

let
  colors = config.lib.stylix.colors;
  fontName = config.stylix.fonts.monospace.name;

  themeFile = pkgs.writeText "rofi-theme.rasi" ''
    * {
      font: "${fontName} 12";
      bg: #${colors.base00};
      fg: #${colors.base05};
      text-sec: #${colors.base07};
      accent: #${colors.base0D};
    }

    window {
      transparency: "real";
      background-color: #${colors.base00}cc;
      border-radius: 16px;
      border: 1px;
      border-color: #${colors.base07}33;
      padding: 8px;
      width: 600px;
      location: center;
      anchor: north;
    }

    mainbox {
      children: [ inputbar, listview, mode-switcher ];
      orientation: vertical;
      spacing: 0;
      background-color: transparent;
    }

    inputbar {
      children: [ prompt, entry ];
      padding: 8px 12px;
      background-color: #${colors.base07}0d;
      border-radius: 12px;
      spacing: 8px;
    }

    prompt {
      enabled: false;
    }

    entry {
      placeholder: "Search...";
      placeholder-color: #${colors.base07}cc;
      text-color: #${colors.base05}ff;
      font: "${fontName} 14";
      background-color: transparent;
    }

    listview {
      layout: vertical;
      columns: 1;
      lines: 5;
      spacing: 4px;
      padding: 8px 4px;
      scrollbar: false;
      background-color: transparent;
      dynamic: true;
      fixed-height: false;
      require-input: true;
    }

    element {
      padding: 8px 12px;
      border-radius: 8px;
      spacing: 12px;
      orientation: horizontal;
      background-color: transparent;
    }

    element selected {
      background-color: #${colors.base0D}33;
    }

    element-text {
      text-color: #${colors.base05}ff;
      font: "${fontName} 13";
      background-color: transparent;
    }

    element-icon {
      size: 24px;
      background-color: transparent;
    }

    mode-switcher {
      enabled: false;
    }
  '';
in
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;

    extraConfig = {
      modi = "drun,window,run,combi";
      combi-modi = "window,drun,run";
      show-icons = true;
      combi-display-format = "{mode}  {text}";
      drun-display-format = "{name}";
      sorting-method = "levenshtein";
      tokenize = false;
      show-keys = false;
      dynamic = true;
    };

    theme = "${themeFile}";
  };

  stylix.targets.rofi.enable = false;

  home.sessionVariables.LAUNCHER = "rofi -show combi";
}
