# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
  [ # Include the results of the hardware scan.
  ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  #! Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.wayland = false;

  #!VirtualBox - Enable Guest edition (needed for copy paste - also must be x11 not wayland)
  #virtualisation.virtualbox.guest.enable = true;
  #virtualisation.virtualbox.guest.x11 = true;

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
  blackbox-terminal
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
  #binutils
  #gcc
  #fakeroot
  #dmenu
  #rofi
  #ulauncher
  #cmatrix
  #figlet
  #colordiff
  #sysstat
  #pciutils
  #shellcheck
  #trash-cli
  #gnome.zenity
  #gdu
  #ffmpeg
  #wkhtmltopdf
  #plocate
  #pkg-config # needed if istalling topgrade with cargo
  #glow
  #micro
  #broot #like ranger but it displays pictures (activate pic with ctrl +  right arrow)
  #lsb-release #instead of #sudo apt install lsb-release #paru lsb-release #sudo dnf install redhat-lsb-core 
  #zoxide



  ###################
  ### Essentials  ###
  ###################

  #Dependencies
  gnome.dconf-editor
  unzip
  curl
  wget
  zsh


  #Gnome Extensions
  gnomeExtensions.dash-to-dock
  gnomeExtensions.burn-my-windows

  #Gui Apps
  conky
  gparted
  espanso


  ###################
  ### NixOS Only  ###
  ###################
  #Install Flatpaks Package Manager
  flatpak
  xdg-desktop-portal-gtk
  polkit_gnome
  

 
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  

  #! List services that you want to enable:

    #########################
    # enable flatpak service#
    #########################
  services.flatpak.enable = true;
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
  };
  security.polkit.enable = true;
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
    #########################
    #     More Services     #
    #########################

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
  #  "qtwebkit-5.212.0-alpha4"
  #];


  ##################
  ##   TESTING    ##
  ##################



}