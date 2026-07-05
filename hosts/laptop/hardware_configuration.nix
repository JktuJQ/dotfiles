{
  config,
  lib,
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "nvme"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems = lib.mkForce {
    "/" = {
      device = "/dev/disk/by-uuid/6dff9ea3-4dfe-4a22-81f4-0a9557945e4b";
      fsType = "btrfs";
      options = [
        "subvol=@"
        "compress=zstd"
      ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/41F2-463C";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/6dff9ea3-4dfe-4a22-81f4-0a9557945e4b";
      fsType = "btrfs";
      options = [
        "subvol=@home"
        "compress=zstd"
      ];
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/6dff9ea3-4dfe-4a22-81f4-0a9557945e4b";
      fsType = "btrfs";
      options = [
        "subvol=@nix"
        "compress=zstd"
      ];
    };
  };
  swapDevices = lib.mkForce [
    {
      device = "/swapfile";
      size = 8192;
    }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
