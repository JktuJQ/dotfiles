{ pkgs, ... }:
{
  programs.obsidian = {
    enable = true;
    cli.enable = true;

    defaultSettings.app = {
      showRibbon = true;
      showStatusBar = true;
      promptDelete = true;
    };

    defaultSettings.communityPlugins = [
      {
        pkg = pkgs.obsidian-plugins.dataview;
        enable = true;
      }
      {
        pkg = pkgs.obsidian-plugins.excalidraw;
        enable = true;
      }
    ];

    defaultSettings.corePlugins = [
      "daily-notes"
      "file-explorer"
      "global-search"
      "graph"
      "command-palette"
      "bookmarks"
      "markdown-importer"
      "outline"
      "page-preview"
      "templates"
    ];
  };
}
