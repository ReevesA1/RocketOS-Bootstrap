{ config, pkgs, ... }:

{
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

#test