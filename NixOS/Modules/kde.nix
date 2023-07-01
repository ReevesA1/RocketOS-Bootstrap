#!FYI's
#https://nixos.wiki/wiki/KDE


{ config, pkgs, lib, ... }:

{
  #! Enable the KDE Desktop Environment.
  #services.xserver.enable = true; #this gets enabled in core-configs.nix
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

#!Excluding some KDE Plasma applications from the default install
environment.plasma5.excludePackages = with pkgs.libsForQt5; [
  discover #though this would remove the icon in dock but it does not (the reason is that there is no back end for discover store on nix yet)
];

#! Install Packages 
  environment.systemPackages = with pkgs; [
    libsForQt5.yakuake
    partition-manager

  ];

programs.partition-manager.enable = true; #this must be on

}