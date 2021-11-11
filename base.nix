{ pkgs, ... }: {
  system.activationScripts.nixosPerms = ''
    chown -R root:wheel /etc/nixos
    chmod -R ug=rwX,o=rX /etc/nixos
  '';

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  console = { keyMap = "uk"; };
  services.xserver = {
    layout = "gb";
    xkbOptions = "compose:ralt";
  };

  users.users.lina = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "adbusers" ];
  };

  environment.systemPackages = with pkgs; [
    (neovim.overrideAttrs (_: { wrapRc = false; }))
    git
    stow
    man-pages
    file
    wget
    efibootmgr
  ];

  services = { mullvad-vpn.enable = true; };
}