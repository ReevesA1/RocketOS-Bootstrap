#!FYI's
#https://nixos.wiki/wiki/KDE


{ config, pkgs, lib, ... }:

{
  #! Enable the KDE Desktop Environment.
  #services.xserver.enable = true; #this gets enabled in core-configs.nix
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  environment.systemPackages = with pkgs; [
    # KDE applications
    kate
    dolphin
    okular
  ];
}

#!Excluding some KDE Plasma applications from the default install