{ pkgs, ... }:
{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  services.pipewire.wireplumber.enable = true;

  security.rtkit.enable = true;

  environment.systemPackages = with pkgs; [
    pavucontrol
  ];
}
