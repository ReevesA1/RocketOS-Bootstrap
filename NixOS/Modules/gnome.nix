#!FYI's
#https://nixos.wiki/wiki/GNOME


{ config, pkgs, ... }:

{
  #! Enable the GNOME Desktop Environment.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    # GNOME applications
    gnome3.gedit
    gnome3.evince
    gnome3.eog
  ];
}

#!Excluding some GNOME applications from the default install