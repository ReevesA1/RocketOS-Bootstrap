{ config, pkgs, lib, ... }:

{

  #! Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #! Allow Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #! Allow Unstable Packages
  # Make sure to run these to commands first 
    # sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
    # sudo nix-channel --update
    nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import <nixos-unstable> {
        config = config.nixpkgs.config;
      };
    };
  };

}
