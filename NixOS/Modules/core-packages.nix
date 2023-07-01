  #test
  { config, pkgs, lib, ... }:
    {
  
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

  ###########DEV
  dotnet-sdk_7
  


  ########################
  ### Univeral Apps    ###
  ########################

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

  

  ];

  }