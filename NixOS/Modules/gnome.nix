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

  

  #! Keyring
  services.gnome.gnome-keyring.enable = true; # I dont think I need this if im using actual gnome but keep it anyway
  
  security.pam.services.login.text = ''
  auth optional ${pkgs.gnome3.gnome-keyring}/lib/security/pam_gnome_keyring.so
  session optional ${pkgs.gnome3.gnome-keyring}/lib/security/pam_gnome_keyring.so auto_start
  password optional ${pkgs.gnome3.gnome-keyring}/lib/security/pam_gnome_keyring.so
'';




  #!Misc Options
  programs.dconf.enable = true;
}