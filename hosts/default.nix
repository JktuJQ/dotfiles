{ inputs }:
let
  lib = inputs.nixpkgs.lib;
  inherit (lib)
    splitString
    elemAt
    filterAttrs
    attrNames
    hasSuffix
    ;

  hostDir = ./.;
  dirContents = builtins.readDir hostDir;
  dirNames = attrNames (filterAttrs (name: type: type == "directory") dirContents);
  parseDir =
    dirName:
    let
      parts = splitString "__" dirName;
      system = elemAt parts 0;
      hostname = elemAt parts 1;
      configurationPath = hostDir + "/${dirName}/configuration.nix";

      usersDir = hostDir + "/${dirName}/users/";
      userFiles =
        if builtins.pathExists usersDir then
          map (name: usersDir + "/${name}") (attrNames (builtins.readDir usersDir))
        else
          [ ];
    in
    {
      inherit
        system
        hostname
        configurationPath
        userFiles
        ;
    };
  configurations = map parseDir dirNames;

  commonSpecialArgs = rec {
    inherit (inputs) self;

    assetsDir = self + "/assets/";

    secretsDir = self + "/secrets/";

    modulesDir = self + "/modules/";
    nixosModulesDir = modulesDir + "nixos/";
    darwinModulesDir = modulesDir + "darwin/";
    homeModulesDir = modulesDir + "home/";
  };

  buildConfig =
    builder: cfg:
    let
      userModules = map (
        file: (import file) (lib.removeSuffix ".nix" (builtins.baseNameOf file))
      ) cfg.userFiles;

      modules = [
        cfg.configurationPath
      ]
      ++ userModules
      ++ (
        if hasSuffix "linux" cfg.system || hasSuffix "darwin" cfg.system then
          [
            (
              { lib, hostname, ... }:
              {
                networking.hostName = lib.mkDefault hostname;
              }
            )
          ]
        else
          [ ]
      );
    in
    builder {
      inherit (cfg) system;
      modules = modules;
      specialArgs = commonSpecialArgs // {
        inherit (cfg) system hostname;
        inherit inputs;
      };
    };
in
builtins.foldl'
  (
    acc: cfg:
    acc
    // (
      if hasSuffix "linux" cfg.system then
        {
          nixosConfigurations = acc.nixosConfigurations // {
            ${cfg.hostname} = buildConfig inputs.nixpkgs.lib.nixosSystem cfg;
          };
        }
      else if hasSuffix "darwin" cfg.system then
        {
          darwinConfigurations = acc.darwinConfigurations // {
            ${cfg.hostname} = buildConfig inputs.darwin.lib.darwinSystem cfg;
          };
        }
      else if cfg.system == "home" then
        {
          homeConfigurations = acc.homeConfigurations // {
            ${cfg.hostname} = buildConfig inputs.home-manager.lib.homeManagerConfiguration cfg;
          };
        }
      else
        throw "Invalid system type in ${cfg.system} (must end with 'linux', 'darwin', or be 'home')"
    )
  )
  {
    nixosConfigurations = { };
    darwinConfigurations = { };
    homeConfigurations = { };
  }
  configurations
