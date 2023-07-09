  { config, pkgs, lib, ... }:
  
  {



  #!X11 stuff#######################################
  services.xserver.enable = true; #this line is needed by both gnome and kde!
  
  environment.systemPackages = with pkgs; [
#not sure I need all these
  xorg.libX11
  xorg.libX11.dev
  xorg.libxcb
  xorg.libXft
  xorg.libXinerama
	xorg.xinit
  xorg.xinput
  ];
  
  #? Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  #! Configure keyboards in X11
  services.xserver = {
    layout = "us"; #United States keyboard
    xkbVariant = "";
    #videoDrivers = [ "amdgpu" "intel" "modesetting" ]; #not sure if need this I have not tested it just thought I would keep it
    #videoDrivers = [ "amdgpu" "intel" "modesetting" "displaylink" ]; #not sure if need this I have not tested it just thought I would keep it
  };
#!##########################################################

  #!polkit
  #I think flatpaks need this? but also kde and gnome for sudo? (gnome has extra steps but i think kde its all built in?)
  security.polkit.enable = true;

  #! Cron
  services.cron.enable = true;


  #! Set your time zone.
  time.timeZone = "America/Toronto";

  #! Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  #! Enable Bluetooth
  hardware.bluetooth.enable = true;
  # had to follow commands from here https://nixos.wiki/wiki/Bluetooth for the gui to see my speakers
  #DO THESE IN ORDER
  #bluetoothctl
  #power on
  #agent on
  #default-agent
  #scan on
  

  #! Enable CUPS to print documents.
  services.printing.enable = true;

  #! Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false; #cant have both
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };


  #!#####################################
  #!     FLATPAK FOR SURE NEEDS THESE   #
  #!#####################################
  #! Enable Dbus - NEEDED for Flatpaks to talk to each other but maybe other programs to
  services.dbus.enable = true;
  
  #! PORTALS - NEEDED FOR FLATPAKS AND GNOME APPS TO WORK IN KDE
  xdg.portal.enable = true;


  #!############################
  #!     Network + Firewall    #
  #!############################
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking = {
    networkmanager.enable = true;
    firewall.allowPing = false;  
    enableIPv6 = false;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 24800 ]; #needed for barrier/synergy
    };
  };

  #!######################
  #!# Set Default SHELL ##
  #!######################
  users.defaultUserShell = pkgs.powershell;
  environment.shells = [ pkgs.powershell ]; #adds it to path in sudo cat /etc/shells #needed for gparted for some reason


  #!#################
  #!# Auto Upgrade ##
  #!#################
  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;
  system.autoUpgrade.enable = true;  
  system.autoUpgrade.allowReboot = true; 
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-23.05";


  #!##################
  #!# Optomizations ##
  #!##################
  nix.settings.auto-optimise-store = true;
  documentation.man.generateCaches = true;

  #faster reboot
  systemd.extraConfig = ''
  DefaultTimeoutStopSec=10s
  '';


  #!#######################
  #!# Garbage Collection ##
  #!#######################
  nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "--delete-older-than 30d";
};




}