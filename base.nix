{ pkgs, ... }: {
  nix = {
    autoOptimiseStore = true;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  nixpkgs.config = {
    packageOverrides = pkgs: {
      neovim = pkgs.neovim.overrideAttrs (_: { wrapRc = false; });
    };
  };

  system.activationScripts.nixosPerms = ''
    chown -R root:wheel /etc/nixos
    chmod -R ug=rwX,o=rX /etc/nixos
  '';

  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" "en_GB.UTF-8/UTF-8" ];

  environment.systemPackages = with pkgs; [ efibootmgr git neovim ];

  users.users.lina = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      fd
      file
      htop
      ldns
      man-pages
      nixfmt
      ripgrep
      stow
      wget
    ];
  };
}
