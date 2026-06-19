{ config, pkgs, lib, ... }:
let
    colors = config.lib.stylix.colors;
in {
    home.packages = with pkgs; [ anyrun anyrun-provider ];
    programs.anyrun = {
        enable = true;
        config = {
            x = { fraction = 0.5; };
            y = { fraction = 0.3; };
            width = { fraction = 0.3; };
            hideIcons = false;
            ignoreExclusiveZones = false;
            layer = "overlay";
            hidePluginInfo = false;
            closeOnClick = false;
            showResultsImmediately = false;
            maxEntries = null;

            plugins = [
                "${pkgs.anyrun}/lib/libapplications.so"
                "${pkgs.anyrun}/lib/libsymbols.so"
                "${pkgs.anyrun}/lib/librink.so"
                "${pkgs.anyrun}/lib/libshell.so"
                "${pkgs.anyrun}/lib/libwebsearch.so"
                "${pkgs.anyrun}/lib/libtranslate.so"
                "${pkgs.anyrun}/lib/libdictionary.so"
                "${pkgs.anyrun}/lib/librandr.so"
                "${pkgs.anyrun}/lib/libactions.so"
                "${pkgs.anyrun}/lib/libnix_run.so"
                "${pkgs.anyrun}/lib/libkidex.so"
            ];
        };
    };

    home.sessionVariables.LAUNCHER = "anyrun";
}
