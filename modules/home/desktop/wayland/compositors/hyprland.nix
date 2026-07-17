{ config, lib, ... }:
let
  colors = config.lib.stylix.colors;

  monitor1 = "eDP-1";
  monitor2 = "HDMI-A-1";

  workspaces = 7;

  lua = lib.generators.mkLuaInline;
  dsp = {
    exec = cmd: lua ''hl.dsp.exec_cmd("${cmd}")'';
    layout = cmd: lua ''hl.dsp.layout("${cmd}")'';
    close = lua "hl.dsp.window.close()";
    kill = lua "hl.dsp.window.kill()";
    float = lua ''hl.dsp.window.float({ action = "toggle" })'';
    fullscreen = lua ''hl.dsp.window.fullscreen({ action = "toggle" })'';
    focusDir = dir: lua ''hl.dsp.focus({ direction = "${dir}" })'';
    moveDir = dir: lua ''hl.dsp.window.move({ direction = "${dir}" })'';
    resizeRel =
      x: y: lua "hl.dsp.window.resize({ x = ${toString x}, y = ${toString y}, relative = true })";
    drag = lua "hl.dsp.window.drag()";
    resize = lua "hl.dsp.window.resize()";
    focusWorkspace = ws: lua ''hl.dsp.focus({ workspace = "${toString ws}" })'';
    moveToWorkspace = ws: lua ''hl.dsp.window.move({ workspace = "${toString ws}" })'';
  };

  bind = keys: dispatcher: {
    _args = [
      keys
      dispatcher
    ];
  };
  bindOpts = keys: dispatcher: opts: {
    _args = [
      keys
      dispatcher
      opts
    ];
  };
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";

    settings = {
      monitor = [
        {
          output = monitor1;
          mode = "preferred";
          position = "auto";
          scale = 1;
        }
        {
          output = monitor2;
          mode = "preferred";
          position = "auto";
          scale = 1;
        }
      ];

      config = {
        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;
          layout = "dwindle";
          col = {
            active_border = "#${colors.base0D}";
            inactive_border = "#${colors.base02}";
          };
        };
        dwindle = {
          force_split = 2;
          preserve_split = true;
        };
        decoration = {
          rounding = 12;
          blur = {
            enabled = true;
            size = 5;
            passes = 2;
          };
          active_opacity = 0.9;
          inactive_opacity = 0.88;
          fullscreen_opacity = 1.0;
        };
        misc = {
          force_default_wallpaper = -1;
          disable_hyprland_logo = true;
        };
        input = {
          kb_layout = "us,ru";
          kb_options = "grp:ctrl_shift_toggle";
          follow_mouse = 1;
          touchpad = {
            natural_scroll = true;
            disable_while_typing = true;
          };
          sensitivity = 0;
        };
      };

      curve = [
        {
          _args = [
            "md3_decel"
            {
              type = "bezier";
              points = lua "{ { 0.05, 0.7 }, { 0.1, 1 } }";
            }
          ];
        }
        {
          _args = [
            "easeOutExpo"
            {
              type = "bezier";
              points = lua "{ { 0.16, 1 }, { 0.3, 1 } }";
            }
          ];
        }
        {
          _args = [
            "fluent_decel"
            {
              type = "bezier";
              points = lua "{ { 0.1, 1 }, { 0, 1 } }";
            }
          ];
        }
      ];

      animation = [
        {
          leaf = "windows";
          enabled = true;
          speed = 4;
          bezier = "md3_decel";
          style = "popin 60%";
        }
        {
          leaf = "windowsIn";
          enabled = true;
          speed = 4;
          bezier = "md3_decel";
          style = "popin 60%";
        }
        {
          leaf = "windowsOut";
          enabled = true;
          speed = 4;
          bezier = "md3_decel";
          style = "popin 60%";
        }
        {
          leaf = "windowsMove";
          enabled = true;
          speed = 4;
          bezier = "md3_decel";
        }
        {
          leaf = "border";
          enabled = true;
          speed = 10;
          bezier = "default";
        }
        {
          leaf = "fade";
          enabled = true;
          speed = 3;
          bezier = "md3_decel";
        }
        {
          leaf = "fadeSwitch";
          enabled = true;
          speed = 3;
          bezier = "md3_decel";
        }
        {
          leaf = "workspaces";
          enabled = true;
          speed = 4;
          bezier = "easeOutExpo";
          style = "slide";
        }
        {
          leaf = "workspacesIn";
          enabled = true;
          speed = 4;
          bezier = "easeOutExpo";
          style = "slide";
        }
        {
          leaf = "workspacesOut";
          enabled = true;
          speed = 4;
          bezier = "easeOutExpo";
          style = "slide";
        }
        {
          leaf = "specialWorkspace";
          enabled = true;
          speed = 4;
          bezier = "md3_decel";
          style = "slidefade";
        }
        {
          leaf = "specialWorkspaceIn";
          enabled = true;
          speed = 4;
          bezier = "md3_decel";
          style = "slidefade";
        }
        {
          leaf = "specialWorkspaceOut";
          enabled = true;
          speed = 4;
          bezier = "md3_decel";
          style = "slidefade";
        }
      ];

      layer_rule = [
        {
          match = {
            namespace = "rofi";
          };
          blur = true;
          ignore_alpha = 0.0;
        }
        {
          match = {
            namespace = "logout_dialog";
          };
          blur = true;
        }
      ];

      device = [
        {
          name = "logitech-g102-lightsync-gaming-mouse";
          sensitivity = -0.2;
          accel_profile = "flat";
        }
      ];

      workspace_rule = lib.concatMap (i: [
        {
          workspace = i;
          monitor = monitor1;
        }
        {
          workspace = i + workspaces;
          monitor = monitor2;
        }
      ]) (lib.range 1 workspaces);

      bind = [
        (bind "SUPER + Q" dsp.close)
        (bind "SUPER + SHIFT + Q" dsp.kill)
        (bind "SUPER + F" dsp.fullscreen)
        (bind "SUPER + SHIFT + F" dsp.float)
        (bind "SUPER + S" (dsp.layout "togglesplit"))
        (bind "SUPER + H" (dsp.focusDir "l"))
        (bind "SUPER + L" (dsp.focusDir "r"))
        (bind "SUPER + K" (dsp.focusDir "u"))
        (bind "SUPER + J" (dsp.focusDir "d"))
        (bind "SUPER + SHIFT + H" (dsp.moveDir "l"))
        (bind "SUPER + SHIFT + L" (dsp.moveDir "r"))
        (bind "SUPER + SHIFT + K" (dsp.moveDir "u"))
        (bind "SUPER + SHIFT + J" (dsp.moveDir "d"))
        (bindOpts "SUPER + ALT + H" (dsp.resizeRel (-10) 0) { repeating = true; })
        (bindOpts "SUPER + ALT + L" (dsp.resizeRel 10 0) { repeating = true; })
        (bindOpts "SUPER + ALT + K" (dsp.resizeRel 0 (-10)) { repeating = true; })
        (bindOpts "SUPER + ALT + J" (dsp.resizeRel 0 10) { repeating = true; })
        (bind "SUPER + T" (dsp.exec config.home.sessionVariables.TERMINAL))
        (bind "SUPER + B" (dsp.exec config.home.sessionVariables.BROWSER))
        (bind "SUPER + SPACE" (dsp.exec config.home.sessionVariables.LAUNCHER))
        (bind "SUPER + E" (dsp.exec config.home.sessionVariables.FILE_MANAGER))
        (bind "SUPER + escape" (dsp.exec "wlogout"))
        (bind "SUPER + CTRL + SHIFT + ALT + Q" (dsp.exec "loginctl terminate-user $USER"))
        (bind "Print" (dsp.exec "hyprshot -m output"))
        (bind "SUPER + Print" (dsp.exec "hyprshot -m window"))
        (bind "SUPER + SHIFT + S" (dsp.exec "hyprshot -m region --clipboard-only --freeze"))
        (bind "SUPER + CTRL + SHIFT + S" (dsp.exec "hyprshot -m region --freeze"))
        (bindOpts "XF86AudioRaiseVolume" (dsp.exec "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+") {
          repeating = true;
        })
        (bindOpts "XF86AudioLowerVolume" (dsp.exec "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-") {
          repeating = true;
        })
        (bind "XF86AudioMute" (dsp.exec "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
        (bind "XF86AudioMicMute" (dsp.exec "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
        (bindOpts "XF86MonBrightnessUp" (dsp.exec "brightnessctl set +5%") { repeating = true; })
        (bindOpts "XF86MonBrightnessDown" (dsp.exec "brightnessctl set 5%-") { repeating = true; })
        (bind "SUPER + left" (dsp.focusWorkspace "r-1"))
        (bind "SUPER + right" (dsp.focusWorkspace "r+1"))
        (bindOpts "SUPER + mouse:272" dsp.drag { mouse = true; })
        (bindOpts "SUPER + mouse:273" dsp.resize { mouse = true; })
      ];
    };

    extraConfig = ''
      local monitor = 0

      hl.bind("SUPER + TAB", function()
          monitor = (monitor + 1) % 2
      end)

      for i = 1, ${toString workspaces} do
          local num = i

          hl.bind("SUPER + " .. tostring(num), function()
              hl.dispatch(hl.dsp.focus({ workspace = num + ${toString workspaces} * monitor }))
          end)
          hl.bind("SUPER + SHIFT + " .. tostring(num), function()
              hl.dispatch(hl.dsp.window.move({ workspace = num + ${toString workspaces} * monitor }))
          end)
          hl.bind("SUPER + SHIFT + TAB + " .. tostring(num), function()
              local other = (monitor + 1) % 2
              hl.dispatch(hl.dsp.window.move({ workspace = num + ${toString workspaces} * other }))
          end)
      end
    '';
  };
}
