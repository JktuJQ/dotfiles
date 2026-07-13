{
  inputs,
  system,
  secretsDir,
  ...
}:
{
  imports = [ inputs.agenix.nixosModules.default ];
  environment.systemPackages = [ inputs.agenix.packages.${system}.default ];

  age.secrets."jktujq_hashed_password" = {
    file = secretsDir + "/jktujq_hashed_password.age";
    owner = "root";
    group = "root";
  };
}
