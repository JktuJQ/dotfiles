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
  dirNames = attrNames (
    filterAttrs (
      name: type:
      let
        parts = splitString "__" name;
      in
      type == "directory" && builtins.length parts == 2 && elemAt parts 0 != "" && elemAt parts 1 != ""
    ) dirContents
  );
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
          map (name: usersDir + "/${name}") (
            attrNames (
              filterAttrs (name: type: type == "regular" && hasSuffix ".nix" name) (builtins.readDir usersDir)
            )
          )
        else
          [ ];
    in
    if !builtins.pathExists configurationPath then
      throw "Host '${dirName}' is missing hosts/${dirName}/configuration.nix. Create this file to configure the host."
    else if !(hasSuffix "linux" system || hasSuffix "darwin" system) then
      throw "Host '${dirName}' has unsupported system '${system}'; the system must end with 'linux' or 'darwin'."
    else
      {
        inherit
          system
          hostname
          configurationPath
          userFiles
          ;
      };
  configurations = map parseDir dirNames;

  addHost =
    namespace: builder: acc: cfg:
    let
      existing = acc.${namespace};
    in
    if builtins.hasAttr cfg.hostname existing then
      throw "Duplicate hostname '${cfg.hostname}' in ${namespace}. Host directories must have unique hostnames within each configuration type."
    else
      acc
      // {
        ${namespace} = existing // {
          ${cfg.hostname} = buildConfig builder cfg;
        };
      };

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

      hostNameModule =
        { lib, hostname, ... }:
        {
          networking.hostName = lib.mkDefault hostname;
        };

      modules = [
        cfg.configurationPath
      ]
      ++ userModules
      ++ (
        if hasSuffix "linux" cfg.system || hasSuffix "darwin" cfg.system then [ hostNameModule ] else [ ]
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
    if hasSuffix "linux" cfg.system then
      addHost "nixosConfigurations" inputs.nixpkgs.lib.nixosSystem acc cfg
    else
      addHost "darwinConfigurations" inputs.darwin.lib.darwinSystem acc cfg
  )
  {
    nixosConfigurations = { };
    darwinConfigurations = { };
  }
  configurations
