  { config, pkgs, lib, ... }:
  
  {

  #!polkit
  #I think flatpaks need this? but also kde and gnome for sudo? (gnome has extra steps but i think kde its all built in?)
  security.polkit.enable = true;

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
  };
#!##########################################################

  #! Networking 
  networking.networkmanager.enable = true;  


  #! Set your time zone.
  time.timeZone = "America/Toronto";

  #! Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";


  

  #! Enable CUPS to print documents.
  services.printing.enable = true;

  #! Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
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



  #!##################
  #!     Firewall    #
  #!##################
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking = {
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


  #!#######################
  #!# Garbage Collection ##
  #!#######################
  nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "--delete-older-than 30d";
};

}