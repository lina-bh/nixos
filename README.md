# Moving NixOS to flakes, with config tracked in version control, without adding scratch configs or `hardware-configuration.nix`

The trick here is to not put `.git` inside `/etc/nixos`, but
to put your config repository in a subdirectory (unoriginally
I use `/etc/nixos/configuration`) and then make two flakes -
one for your configuration, and one that nixos-rebuild will read
([./nixos-flake.nix](nixos-flake.nix)). You should use a *hard link*
(`ln` without `-s`) to put the latter flake in `/etc/nixos`: if it's
a symlink, Nix will just follow the link into your git repository and
then it will just read your config's flake.
