#!FYI's
#https://nixos.wiki/wiki/GNOME


{ config, pkgs, lib, ... }:

{
  #! Enable the GNOME Desktop Environment.
  #services.xserver.enable = true; #this gets enabled in core-configs.nix because it is used by kde as well
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;


#!Excluding some GNOME applications from the default install
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-photos
    #gnome-console #dont remove or ill lose the right click open in terminal option in nautilus
  ] ++ (with pkgs.gnome; [
    geary
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
  blackbox-terminal 
  gnome.gnome-tweaks
  gnome.gnome-session
  gnome.sushi
  guake
  gparted
  dconf #cli version
  gnome.dconf-editor
  #gsettings-desktop-schemas #I use dconf to change everything
  papirus-folders #folder colors in nautilus

  #Extensions
  gnome-extension-manager
  gnomeExtensions.dash-to-dock
  gnomeExtensions.burn-my-windows
  #gnomeExtensions.tray-icons-reloaded #Tray icons - this one works as of june 29 2023. (does not show protonvpn tho but its ok)
  gnomeExtensions.appindicator #tray icon - This is the better one - site https://nixos.wiki/wiki/GNOME SAYS I should enable this service? (services.dbus.packages = with pkgs; [ gnome2.GConf ];)
  gnomeExtensions.systemd-manager

  #KDE does not need a polkit
  polkit_gnome


  #?PORTALS
  xdg-desktop-portal #needed for flatpaks
  xdg-desktop-portal-wlr #Backend for wlroots-based Wayland compositor
  #

  #!Testing
  gnome3.gvfs

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

  

  #! Keyring
  services.gnome.gnome-keyring.enable = true; # I dont think I need this if im using actual gnome but keep it anyway
  


  #!Misc Options
  programs.dconf.enable = true;
  services.gnome.gnome-online-accounts.enable = true;



  #! Helped with Video Thumbnails in nautilus
  environment.sessionVariables.GST_PLUGIN_SYSTEM_PATH_1_0 = lib.makeSearchPathOutput "lib" "lib/gstreamer-1.0" (with pkgs.gst_all_1; [
  gst-plugins-good
  gst-plugins-bad
  gst-plugins-ugly
  gst-libav
]);



}