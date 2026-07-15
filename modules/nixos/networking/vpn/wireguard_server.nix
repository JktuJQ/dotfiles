{
  config,
  pkgs,
  secretsDir,
  ...
}:
let
  serverIP = "10.0.0.1";
  subnet = "10.0.0.0/24";
  port = 51820;
  externalInterface = "eth0";
  peersFile = "/var/lib/wireguard/peers.conf";
in
{
  networking.firewall.allowedUDPPorts = [ port ];

  networking.nat = {
    enable = true;
    externalInterface = externalInterface;
    internalInterfaces = [ "wg0" ];
  };
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;

  age.secrets."wireguard_server_key" = {
    file = secretsDir + "wireguard_server_key.age";
    owner = "root";
    group = "root";
  };
  networking.wireguard = {
    enable = true;
    interfaces.wg0 = {
      type = "amneziawg";
      ips = [ "${serverIP}/24" ];
      privateKeyFile = config.age.secrets."wireguard_server_key".path;
      listenPort = port;
      peers = [ ];

      postSetup = ''
        ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s ${subnet} -o ${externalInterface} -j MASQUERADE
      '';
      postShutdown = ''
        ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s ${subnet} -o ${externalInterface} -j MASQUERADE
      '';
    };
  };

  environment.systemPackages = with pkgs; [
    wireguard-tools
    (pkgs.writeShellScriptBin "wg-clients" ''
      #!/run/current-system/sw/bin/bash
      set -e
      PEERS_FILE="${peersFile}"
      SERVER_PUBKEY="$(wg show wg0 private-key | wg pubkey)"
      POOL_START=100
      POOL_END=254

      get_next_ip() {
        local used_ips
        used_ips=$(grep -oP 'AllowedIPs = \K[0-9.]+' "$PEERS_FILE" 2>/dev/null || true)
        for i in $(seq $POOL_START $POOL_END); do
          ip="10.0.0.$i"
          if ! echo "$used_ips" | grep -q "$ip"; then
            echo "$ip"
            return 0
          fi
        done
        echo "No free IP" >&2
        return 1
      }

      case "$1" in
        add)
          [ -z "$2" ] && { echo "Usage: $0 add <name>"; exit 1; }
          CLIENT_NAME="$2"
          CLIENT_PRIV=$(wg genkey)
          CLIENT_PUB=$(echo "$CLIENT_PRIV" | wg pubkey)
          IP=$(get_next_ip) || exit 1
          {
            echo ""
            echo "# BEGIN $CLIENT_NAME"
            echo "[Peer]"
            echo "PublicKey = $CLIENT_PUB"
            echo "AllowedIPs = $IP/32"
            echo "# END $CLIENT_NAME"
          } >> "$PEERS_FILE"
          wg syncconf wg0 <(wg-quick strip wg0)
          echo "--- CLIENT CONFIG ---"
          echo "[Interface]"
          echo "PrivateKey = $CLIENT_PRIV"
          echo "Address = $IP/24"
          echo "DNS = 1.1.1.1"
          echo ""
          echo "[Peer]"
          echo "PublicKey = $SERVER_PUBKEY"
          echo "Endpoint = $(curl -s ifconfig.me):${toString port}"
          echo "AllowedIPs = 0.0.0.0/0"
          echo "PersistentKeepalive = 25"
          echo "--- END ---"
          ;;
        remove)
          [ -z "$2" ] && { echo "Usage: $0 remove <name>"; exit 1; }
          sed -i "/# BEGIN $2/,/# END $2/d" "$PEERS_FILE"
          wg syncconf wg0 <(wg-quick strip wg0)
          echo "Client $2 removed."
          ;;
        list)
          echo "Active peers:"
          wg show wg0 peers
          ;;
        *)
          echo "Usage: $0 {add|remove|list} [name]"
          exit 1
          ;;
      esac
    '')
  ];

  systemd.tmpfiles.rules = [
    "d ${builtins.dirOf peersFile} 0755 root root -"
    "f ${peersFile} 0644 root root - # Dynamic peers\n"
  ];
}
