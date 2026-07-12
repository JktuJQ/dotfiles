{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
  };

  networking.firewall.logRefusedConnections = true;
}
