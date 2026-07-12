{
  services.openssh = {
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      ChallengeResponseAuthentication = false;

      PermitRootLogin = "no";

      PermitEmptyPasswords = false;
      X11Forwarding = false;

      MaxAuthTries = 3;

      Macs = [
        "hmac-sha2-512-etm@openssh.com"
        "hmac-sha2-256-etm@openssh.com"
      ];
      KexAlgorithms = [
        "curve25519-sha256"
        "curve25519-sha256@libssh.org"
        "diffie-hellman-group-exchange-sha256"
      ];
      Ciphers = [
        "chacha20-poly1305@openssh.com"
        "aes256-gcm@openssh.com"
        "aes128-gcm@openssh.com"
        "aes256-ctr"
        "aes128-ctr"
      ];
    };
    extraConfig = ''
      PerSourcePenalties crash:3600s authfail:3600s max:86400s
    '';
  };
  networking.firewall.allowedTCPPorts = [ 22 ];
  services.openssh.ports = [ 22 ];
}
