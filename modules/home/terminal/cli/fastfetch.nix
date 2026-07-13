{ assetsDir, ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "auto";
        source = assetsDir + "NixOs_logo.png";
        height = 22;
        padding = {
          top = 0;
          right = 3;
        };
      };
      display = {
        separator = " : ";
        key = {
          width = 0;
        };
      };
      modules = [
        "break"
        {
          type = "custom";
          format = "     󱇐 : Mine and mine only!";
        }
        {
          type = "custom";
          format = "   ╭───────────────────────────────────────────────────╮";
        }
        {
          type = "os";
          key = "     󱄅 OS      ";
          keyColor = "31";
        }
        {
          type = "host";
          key = "      Device  ";
          format = "{2}";
          keyColor = "33";
        }
        {
          type = "kernel";
          key = "      Kernel  ";
          keyColor = "32";
        }
        {
          type = "packages";
          key = "     󰏖 Packages";
          keyColor = "36";
        }
        {
          type = "terminal";
          key = "     󰞷 Terminal";
          keyColor = "34";
        }
        {
          type = "wm";
          key = "     󱂬 WM      ";
          keyColor = "35";
        }
        {
          type = "custom";
          format = "   ╰───────────────────────────────────────────────────╯";
        }
        "break"
        {
          type = "title";
          key = "     󰮚";
          format = "{1} @ {2}";
        }
        {
          type = "custom";
          format = "   ╭───────────────────────────────────────────────────╮";
        }
        {
          type = "cpu";
          key = "     󰻠 CPU     ";
          keyColor = "31";
          format = "{1}";
        }
        {
          type = "gpu";
          key = "     󰢮 GPU     ";
          keyColor = "33";
          format = "{2}";
        }
        {
          type = "memory";
          key = "     󰍛 Memory  ";
          keyColor = "32";
        }
        {
          type = "display";
          key = "     󰹑 Display ";
          keyColor = "36";
          format = "{width}x{height} @ {refresh-rate} Hz";
        }
        {
          type = "command";
          key = "      OS Age  ";
          keyColor = "34";
          text = "birthd=$(stat -c %W /); echo $(( ( $(date +%s) - birthd ) / 86400 )) days";
        }
        {
          type = "uptime";
          key = "     󰅐 Uptime  ";
          keyColor = "35";
        }
        {
          type = "custom";
          format = "   ╰───────────────────────────────────────────────────╯";
        }
        "break"
        {
          type = "colors";
          symbol = "circle";
          paddingLeft = 5;
        }
        "break"
      ];
    };
  };
}
