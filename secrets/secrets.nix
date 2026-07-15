let
  ssh_keys = import ./ssh_keys.nix;
in
{
  "jktujq_hashed_password.age".publicKeys = with ssh_keys; [
    hosts.laptop
    users.jktujq
  ];

  "wireguard_server_key.age".publicKeys = with ssh_keys; [
    hosts.vps
    users.jktujq
  ];
}
