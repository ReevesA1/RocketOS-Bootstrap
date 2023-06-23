#! Most of these configs came from Titus https://github.com/ChrisTitusTech/nixos-titus/blob/main/configuration.nix
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).


{ config, pkgs, lib, ... }:

{
  imports =
  [ # Include the results of the hardware scan.
  ./hardware-configuration.nix
  ];

  # Bootloader.
  # Use the systemd-boot EFI boot loader needed for sure for parallels on mac.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true; # this is usefule if I ever dual boot

# here are grub options if ever I need them
  #boot.loader.grub.enable = true; #!Needed if in a virtual machine (disable the two systemd lines above)
  #boot.loader.grub.device = "/dev/sda"; #!Needed if in a virtual machine (disable the two systemd lines above)
  #boot.loader.grub.useOSProber = true; #!Needed if in a virtual machine (disable the two systemd lines above)
  #? Other Examples of lines I could use with grub
  #boot.loader-grub.device = "/boot": #? Different path some OS use I guess
  #boot.loader.grub.efiInstallAsRemovable = true;
  #boot.loader.grub.efiSupport = true:



  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  #networking.hostName = "nixos-xxx"; # Define your hostname. I don't use it so everything has the sanem hostname?
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  #! Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  #! Wayland Support
  #Original line that works
  #services.xserver.displayManager.gdm.wayland = true; #? wayland is better for parallels but not virtualbox also wayland no good for barrier

  #If statement depending on architecture (works)
  services.xserver.displayManager.gdm.wayland =
    if builtins.currentSystem == "x86_64-linux" then #aka not parallels and x86 using barrier
      false
    else if builtins.currentSystem == "aarch64-linux" then #aka parallels
      true
    else
      false;


  #!VirtualBox - Enable Guest edition (needed for copy paste - also must be x11 not wayland)
  #virtualisation.virtualbox.guest.enable = true;
  #virtualisation.virtualbox.guest.x11 = true;

  #A script I am trying to see if I can enable those two lines above automaticly by detecting if in a virtual box
  # did not work even when added this to top level { config, pkgs, lib, ... }:
  /*
{
  options.virtualisation.isVirtualBoxGuest = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Whether the system is running inside a VirtualBox virtual machine.";
  };

  config = lib.mkIf config.virtualisation.isVirtualBoxGuest {
    virtualisation.virtualbox.guest.enable = true;
    virtualisation.virtualbox.guest.x11 = true;
  };
}
*/
#!##########################
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
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

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rocket = {
    isNormalUser = true;
    description = "rocket";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      #I think this is where I would put user only apps not system wide
    ];
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "rocket";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Allow Unstable Packages
  # Make sure to run these to commands first 
  # sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
  # sudo nix-channel --update
    nixpkgs.config = {
    # Allow Unstable Packages
    packageOverrides = pkgs: {
      unstable = import <nixos-unstable> {
        config = config.nixpkgs.config;
      };
    };
  };

  #! List packages installed in system profile. To search, run:
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



  ###################
  ### Essentials  ###
  ###################

  #Dependencies (all in read me)
  gnome.dconf-editor 
  unzip
  curl
  wget
  zsh
  git


  #Gnome and Gnome Extensions
  gnome.gnome-tweaks
  gnome.gnome-session
  guake
  gnomeExtensions.dash-to-dock
  gnomeExtensions.burn-my-windows
  gnomeExtensions.tray-icons-reloaded #show megasync with syncing actions and barrier tray icons as of June 2023 and protonvpn just use native tray icon indicator now


  ###################
  ### NixOS Only  ###
  ###################
  #Install Flatpaks Package Manager
  flatpak
  xdg-desktop-portal-gtk
  polkit_gnome

  #Hoping this helps with screen tearing
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

  #Misc
  veracrypt #(Not aarch64)
  gparted
  conky
  protonvpn-cli


  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  

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

  #SystemD Services
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

#!No GO auto starting proton
/*
  user.services.protonvpn = {
    description = "ProtonVPN";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      #ExecStart = "${pkgs.protonvpn-cli}/bin/protonvpn-cli connect --cc CA";
      ExecStart = "/run/current-system/sw/bin/protonvpn-cli connect --cc CA";
      Restart = "always";
      RestartSec = "30";
    };
  };
  */
}; 

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;


    #########################
    #     Firewall    #
    #########################
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
    networking.firewall.enable = false;
    networking.enableIPv6 = false;

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


  ##########################
  ##  Insecure Packages   ##
  ##########################

  #nixpkgs.config.permittedInsecurePackages = [
  #  "qtwebkit-5.212.0-alpha4" # was needed for wkhtmltopdf but i don't use anymore fuck it
  #];


  ##################
  ##   TESTING    ##
  ##################
  #!NVIDA Settings


  # NVIDIA drivers are unfree.
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
    ];

    # Tell Xorg to use the nvidia driver, also need intel for for ROG-Strix-Laptop 
    services.xserver.videoDrivers = ["nvidia"]; #? Adding "intel" here with nvidia I was able to get laptop screen to work as well as external monitor but very glitchy
    
  

  hardware = {
    nvidia.optimus_prime.enable = true;
    nvidia.optimus_prime.intelBusId = "PCI:00:02:0";
    nvidia.optimus_prime.nvidiaBusId = "PCI:01:00:0";
    # nvidiaOptimus.disable = true;
    opengl = {
    extraPackages = [
    pkgs.libGL_driver
    pkgs.linuxPackages.nvidia_x11.out
    pkgs.vaapiIntel
    pkgs.vaapiVdpau
    pkgs.libvdpau-va-gl
    ];
    driSupport = true;
    driSupport32Bit = true;

    };

#!######################################################
  };
}