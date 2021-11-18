{ pkgs, ... }: {
  imports = [ ./uk.nix ];

  networking.hostName = "t480s";

  hardware.opengl = { extraPackages = [ pkgs.vaapiIntel ]; };

  hardware.bluetooth.enable = true;
}
