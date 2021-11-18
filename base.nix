{ pkgs, ... }: {
  system.activationScripts.nixosPerms = ''
    chown -R root:wheel /etc/nixos
    chmod -R ug=rwX,o=rX /etc/nixos
  '';

  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" "en_GB.UTF-8/UTF-8" ];

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
