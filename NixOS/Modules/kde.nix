#!FYI's
#https://nixos.wiki/wiki/KDE


{ config, pkgs, lib, ... }:

{
  #! Enable the KDE Desktop Environment.
  #services.xserver.enable = true; #this gets enabled in core-configs.nix because it gets used by gnome as well
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

#!Excluding some KDE Plasma applications from the default install
environment.plasma5.excludePackages = with pkgs.libsForQt5; [
  discover #though this would remove the icon in dock but it does not (the reason is that there is no back end for discover store on nix yet)
];


#! Use KDE5 unstable
nixpkgs.config.packageOverrides = super: let self = super.pkgs; in {
    plasma5_stable = self.plasma5_latest;
    kdeApps_stable = self.kdeApps_latest;
};


#! Install Packages 
  environment.systemPackages = with pkgs; [
    libsForQt5.kaccounts-providers 
    libsForQt5.kaccounts-integration
    libsForQt5.yakuake
    partition-manager


    #?PORTALS
    xdg-desktop-portal #needed for flatpaks
    xdg-desktop-portal-wlr #Backend for wlroots-based Wayland compositor
    xdg-desktop-portal-gnome #needed for flatpaks
    xdg-desktop-portal-gtk #needed for flatpaks
    libsForQt5.kde-gtk-config


  ];


#!Misc Options
programs.partition-manager.enable = true; 

}