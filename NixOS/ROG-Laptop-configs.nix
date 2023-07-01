#! Most of these configs came from Titus https://github.com/ChrisTitusTech/nixos-titus/blob/main/configuration.nix
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).


{ config, pkgs, lib, ... }:

{
  imports =
  [ # Include the results of the hardware scan.
  ./hardware-configuration.nix
  ./nix-special-configs.nix
  ./core-congfigs.nix
  ./users.nix
  ./gnome.nix
  #./kde.nix
  ];

  #! Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true; 


  #! Networking 
  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;  


  #! Wayland Support
  services.xserver.displayManager.gdm.wayland = false; 

  
  #! List packages installed in system profile. 
  environment.systemPackages = with pkgs; [

  ##########################################
  ### PACKAGES TO GET GUMROCKETOS GOING  ###
  ##########################################
  gum
  git
  alacritty
  starship
  unstable.powershell

  ####################################################
  ### Nix Packages - Command Line Core Utilities   ###
  ####################################################
  topgrade
  cron
  coreutils
  fish
  findutils
  fd
  nettools
  neofetch
  exa
  htop
  bat
  ripgrep
  wget
  curl
  xclip
  fzf
  gnumake # is this make?
  binutils
  gcc
  fakeroot
  dmenu
  rofi
  ulauncher
  cmatrix
  asciiquarium
  figlet
  colordiff
  sysstat
  pciutils
  shellcheck
  trash-cli
  gnome.zenity
  gdu
  ffmpeg
  plocate
  pkg-config # needed if istalling topgrade with cargo
  glow
  micro
  broot #like ranger but it displays pictures (activate pic with ctrl +  right arrow)
  lsb-release #instead of #sudo apt install lsb-release #paru lsb-release #sudo dnf install redhat-lsb-core 
  zoxide
  cowsay
  dmidecode #I use this for laptop sound fix
  inetutils #needed for telnet good to have
  hddtemp #needed for conky
  lm_sensors #needed for conky
  nvme-cli #needed for conky
  



  ###################
  ### Essentials  ###
  ###################

  #Dependencies (all in read me)
  #gnome.dconf-editor #gets installed in gnome setup
  unzip
  curl
  wget
  zsh
  git



  ###################
  ### NixOS Only  ###
  ###################
  #Install Flatpaks Package Manager
  flatpak
  xdg-desktop-portal-gtk
  polkit_gnome

  #not sure I need these
  xorg.libX11
  xorg.libX11.dev
  xorg.libxcb
  xorg.libXft
  xorg.libXinerama
	xorg.xinit
  xorg.xinput

  ########################
  ### Univeral Apps    ###
  ########################

  #podman
  unstable.podman
  podman-desktop
  distrobox

  #Base Apps
  veracrypt #(Not aarch64)
  gparted
  conky
  protonvpn-cli
  #synergy #outdate
  firefox
  megasync #(Not aarch64)
  blackbox-terminal
  vlc
  appimage-run
  vscode #use this over the flatpak version so in shells they see the word code therefor my vspowershell custom profil will work 



  ##############################
  ### ROG-Laptop Exclusives  ###
  ##############################
  dotnet-sdk_7

  ###########################################
  ### Testing Add to all other ones if yes###
  ##########################################

  

  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  

########################
#    virtualisation    #
########################

  virtualisation = {
    #docker.enable = true; 
    #virtualbox.host.enable = true;
    #libvirtd.enable = true; 
    podman.enable = true;
    podman.dockerCompat = true;
  };



#! List services that you want to enable:

####################
#     Services     #
####################

  # FLATPAKS
  services.flatpak.enable = true;

  # FlatPaks Dependencies
  services.dbus.enable = true; # needed for flatpaks to talk to each other
  xdg.portal = {
    enable = true; # This for sure needs to be on
    #wlr.enable = true; # Not sure what this setting is for
    #extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; #Only needed if not using Gnome
  };

  #Misc Stuff not sure if needed for flatpaks?
  security.polkit.enable = true;



#?#######SYSTEMD BOOT SERVICES
#? Diagnose with these next commands
#journalctl --user-unit foo.service  
#systemctl --user status foo 
#systemctl --user start foo



};


  ########################
  #     Misc Services    #
  ########################
  #services.openssh.enable = true;
  #services.udev.packages = with pkgs; [ logitech-udev-rules ]; #needed for solaar
  #services.xserver.excludePackages = [ pkgs.xterm ]; #I removed xterm but then distrobox icon entries don't work


  ###################
  #     Firewall    #
  ###################
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

  ###########
  ## SHELL ##
  ###########
  users.defaultUserShell = pkgs.powershell;


  ##################
  ## Auto Upgrade ##
  ##################
  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;
  system.autoUpgrade.enable = true;  
  system.autoUpgrade.allowReboot = true; 
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-23.05";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?


    #########################
    #     NVIDA Settings    #
    #########################

  #! https://nixos.wiki/wiki/Nvidia

    services.xserver.videoDrivers = ["nvidia"]; 
    programs.xwayland.enable = true; #was only needed for wayland to work

  

  hardware = {
    nvidia.prime.sync.enable = true;
    nvidia.prime.intelBusId = "PCI:00:02:0"; # fyi need both nvidia and intel because laptop has both or else built in screen wont work
    nvidia.prime.nvidiaBusId = "PCI:01:00:0";
    nvidia.modesetting.enable = true; #needed for wayland to work
    nvidia.powerManagement.enable = true; #fix suspend/resume screen corruption in sync mode
    opengl = {
    extraPackages = [
    pkgs.mesa_drivers
    pkgs.linuxPackages.nvidia_x11.out
    pkgs.vaapiIntel
    pkgs.vaapiVdpau
    pkgs.libvdpau-va-gl
    ];
    driSupport = true;
    driSupport32Bit = true;

    };
};

#Use the command below to see if it works
#sudo journalctl -b | grep resumeCommands
powerManagement.resumeCommands = ''
  echo "Running resumeCommands test before" 
  
  echo "Running resumeCommands test after" 
'';


  ##########################
  ##  Insecure Packages   ##
  ##########################



  ##################
  ##   TESTING    ##
  ##################

  
}