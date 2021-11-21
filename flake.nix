{
  # inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; };
  outputs = inputs: {
    nixosModules = {
      base = import ./base.nix;
      t480s = import ./t480s.nix;
    };
  };
}
