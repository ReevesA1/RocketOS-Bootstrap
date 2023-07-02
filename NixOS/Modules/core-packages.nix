{ config, pkgs, lib, ... }:
    {
  
  #!system wide packages
  environment.systemPackages = with pkgs; [

  ##########################################
  ### PACKAGES TO GET GUMROCKETOS GOING  ###
  ##########################################
  gum
  git
  alacritty
  starship
  unstable.powershell

  #Dependencies (all in read me)
  unzip
  curl
  wget
  zsh
  git

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
  gnumake
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
  autojump
  gh #github-cli
  gnugrep
  tldr
  variety
  zip




  ###########DEV
  dotnet-sdk_7
  


  #############################
  ### Univeral Base Apps    ###
  #############################

  conky
  protonvpn-cli
  #protonvpn-gui #might need this to login originaly if 2fa doesnt work but then just use protonvpn-cli - command is protonvpn-cli login [ProtonVPN username]
  #synergy #outdate
  firefox
  #blackbox-terminal #doesnt work properly in kde use the flatpak version
  vlc
  appimage-run
  vscode #use this over the flatpak version so in shells they see the word code therefor my vspowershell custom profil will work 



  ];

#! services needed for some apps

#?plocate (after do a sudo updatedb  and then sudo plocate Bitcoin.png should work)
services.locate.enable = true;
users.groups.plocate = {};
services.locate.interval = "hourly";



}

