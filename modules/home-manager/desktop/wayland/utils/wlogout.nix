{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = "Logout";
        keybind = "l";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "s";
      }
    ];
  };
}
