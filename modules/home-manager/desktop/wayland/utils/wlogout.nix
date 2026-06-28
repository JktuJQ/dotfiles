{
  config,
  pkgs,
  ...
}:

let
  colors = config.lib.stylix.colors;
  fontName = config.stylix.fonts.monospace.name;

  wlogout = pkgs.writeShellScriptBin "wlogout" ''
    ${pkgs.wlogout}/bin/wlogout --buttons-per-row 4 "$@"
  '';
in
{
  programs.wlogout = {
    enable = true;

    package = wlogout;

    layout = [
      {
        label = "lock";
        action = "loginctl lock-session";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
    ];

    style = ''
      * {
        font-family: "${fontName}", monospace;
        font-weight: 700;
        background-image: none;
      }

      window {
        background-color: rgba(0, 0, 0, 0.6);
      }

      button {
        color: #${colors.base05};
        background-color: #${colors.base00};
        border-style: none;
        border-radius: 20px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 30%;
        margin: 20px 12px;
        min-width: 90px;
        min-height: 90px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),
                    0 6px 20px 0 rgba(0, 0, 0, 0.19);
        transition: all 0.2s ease;
      }

      button:focus, button:active, button:hover {
        background-color: #${colors.base01};
        color: #${colors.base05};
        outline-style: none;
      }

      #lock {
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/lock.png"));
      }
      #logout {
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/logout.png"));
      }
      #reboot {
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/reboot.png"));
      }
      #shutdown {
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png"));
      }
    '';
  };
}
