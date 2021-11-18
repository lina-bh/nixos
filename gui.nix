{ config, pkgs, ... }: {
  networking.networkmanager.enable = true;

  services.xserver = {
    enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma5 = {
      enable = true;
      runUsingSystemd = true;
    };
  };

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  services.earlyoom.enable = true;

  services.mullvad-vpn.enable = true;

  users.users.lina = {
    extraGroups = [ "networkmanager" ];
    packages = with pkgs; [ spectacle mullvad-vpn xsel gitFull ];
  };
}
