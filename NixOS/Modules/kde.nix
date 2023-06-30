{ config, pkgs, ... }:

{
  services.xserver.desktopManager.plasma5.enable = true;

  environment.systemPackages = with pkgs; [
    # KDE applications
    kate
    dolphin
    okular
  ];
}

#Test