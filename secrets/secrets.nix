let
  ssh_keys = import ./ssh_keys.nix;
in
{
  "jktujq_hashed_password.age".publicKeys = [
    ssh_keys.hosts.laptop
    ssh_keys.users.jktujq
  ];
}
