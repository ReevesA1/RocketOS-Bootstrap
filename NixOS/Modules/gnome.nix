#!FYI's
#https://nixos.wiki/wiki/GNOME


{ config, pkgs, lib, ... }:

{
  #! Enable the GNOME Desktop Environment.
  #services.xserver.enable = true; #this gets enabled in core-configs.nix
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;


#!Excluding some GNOME applications from the default install
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-photos
    #gnome-console #dont remove or ill lose the right click open in terminal option in nautilus
  ] ++ (with pkgs.gnome; [
    geary
    totem
    cheese
    epiphany
    gnome-contacts
    gnome-weather
    gnome-clocks
    gnome-maps
    gnome-calculator
    gnome-connections
  ]);

#! Install Packages 
environment.systemPackages = with pkgs; [
  gnome.gnome-tweaks
  gnome.gnome-session
  guake
  gparted
  dconf #cli version
  gnome.dconf-editor

  #Extensions
  gnomeExtensions.dash-to-dock
  gnomeExtensions.burn-my-windows
  #gnomeExtensions.tray-icons-reloaded #Tray icons - this one works as of june 29 2023. (does not show protonvpn tho but its ok)
  gnomeExtensions.appindicator #tray icon - This is the better one - site https://nixos.wiki/wiki/GNOME SAYS I should enable this service? (services.dbus.packages = with pkgs; [ gnome2.GConf ];)

  #Only for NixOS not other distro flavours
  polkit_gnome

];

  #! Pole Kit from Chris Titus
  systemd = {
  user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
  };
    extraConfig = ''
      DefaultTimeoutStopSec=10s
    '';
  };

  programs.dconf.enable = true;
}