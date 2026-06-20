{ config, ... }:
{
  xdg.configFile."uwsm/env".text = ''
    source ${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh
  '';
}
