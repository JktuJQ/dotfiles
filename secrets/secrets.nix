let
  hosts = {
    laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICuNNyKCjbRZbfyrbaYIstUp/WBEIApQxBSnhiESw7sk root@nixos";
  };
  users = {
    jktujq = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC8iPBGPTjWOLbKCdMji5l6UWxLvxqzYLrFfI2HJ0e6N odmamontov@gmail.com";
  };
in
{
  "jktujq_hashed_password.age".publicKeys = [
    hosts.laptop
    users.jktujq
  ];
}
