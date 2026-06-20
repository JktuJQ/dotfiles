{ lib }:
{
  collectConfigFiles = (import ./collect_config_files.nix { inherit lib; }).collectConfigFiles;
}
