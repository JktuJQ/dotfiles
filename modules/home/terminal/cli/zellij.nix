{ config, ... }:
{
  programs.zellij = {
    enable = true;

    extraConfig = ''
      show_startup_tips false
      show_release_notes false
      default_shell "${config.home.sessionVariables.SHELL}"

      keybinds {
        normal {
          bind "Alt n" { NewTab; }
          bind "Alt r" { SwitchToMode "RenameTab"; TabNameInput 0; }
          bind "Alt q" { CloseTab; }
          bind "Alt h" { GoToPreviousTab; }
          bind "Alt l" { GoToNextTab; }
          bind "Alt s" {
            LaunchOrFocusPlugin "session-manager" {
              floating true
              move_to_focused_tab true
            };
          }
          bind "Alt k" { SwitchToMode "Scroll"; }

          bind "Ctrl q" { CloseFocus; }
          bind "Ctrl n" { NewPane; }
          bind "Ctrl \\" { NewPane "Right"; }
          bind "Ctrl -" { NewPane "Down"; }

          bind "Ctrl h" { MoveFocus "Left"; }
          bind "Ctrl j" { MoveFocus "Down"; }
          bind "Ctrl k" { MoveFocus "Up"; }
          bind "Ctrl l" { MoveFocus "Right"; }

          bind "Ctrl H" { MovePane "Up"; }
          bind "Ctrl J" { MovePane "Down"; }

          bind "Ctrl Left"  { Resize "Increase Left"; }
          bind "Ctrl Right" { Resize "Increase Right"; }
          bind "Ctrl Up"    { Resize "Increase Up"; }
          bind "Ctrl Down"  { Resize "Increase Down"; }

          bind "Ctrl f" { ToggleFocusFullscreen; }
          bind "Ctrl p" { ToggleFloatingPanes; }
        }

        scroll {
          bind "Alt k" { SwitchToMode "Normal"; }
        }
      }
    '';
  };
}
