#!/usr/bin/env zsh
#Using this shbang for echo and read with color to work
##############
#   NixOS    #
##############

#⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣆⠀⠀⠀⠘⣿⣿⣿⣧⡀⠀⣰⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣧⠀⠀⠀⠈⢿⣿⢿⣶⣴⣿⣿⣿⠉⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠀⠀⢀⣤⣤⣤⣼⣿⣿⣿⣧⣤⣤⣤⣬⣿⣿⡿⣟⣿⣷⠃⠀⠀⠀⡀⠀⠀⠀⠀
#⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⡄⠀⠀⠀⣼⣿⡄⠀⠀⠀
#⠀⠀⠀⠉⠉⠉⠉⠉⣩⣿⣿⣿⠟⠉⠉⠉⠉⠉⠁⠻⣿⣿⣿⣆⢀⣾⣿⣿⡿⠀⠀⠀
#⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣟⠏⠀⠀⠀⠀⠀⠀⠀⠀⠹⣷⣿⣿⣾⣿⣿⡿⠁⠀⠀⠀
#⣴⣷⣶⣶⣶⣶⣾⣿⣿⣯⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦
#⠻⢿⢿⡻⢿⣿⣟⣯⣷⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⡿⠿⠿⠿⠿⠿⠟
#⠀⠀⠀⢀⣾⣿⢿⡻⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠠⣾⣿⣿⠿⠁⠙⣿⣿⣿⣧⣀⣀⣀⣀⣀⣀⣴⣿⣿⣿⣋⣀⣀⣀⣀⣀⠀⠀⠀
#⠀⠀⠀⠘⢿⡟⠀⠀⠀⢘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀
#⠀⠀⠀⠀⠈⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⡛⠓⠛⠛⢺⣿⢿⣿⡗⠛⠓⠛⠁⠀⠀⠀⠀
#⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⠟⢻⣿⣿⣷⡄⠀⠀⠀⠻⣿⣟⣷⣆⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⠏⠀⠀⢻⣿⣿⣿⡄⠀⠀⠀⠹⣿⡿⡟⠀⠀⠀⠀⠀

if [ "$(grep "^ID=" /etc/*-release | cut -d= -f2 | tr -d '"')" = "nixos" ]; then

  # Add Flathub
  echo "Adding Flathub repo...Press Enter To Continue..."
  read
  flatpak remote-add --system --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  echo "Reboot Again ...Press Enter To Continue..."
  read



#!##################################################################################################################################
#!##################################################################################################################################
#!##################################################################################################################################

#*    _nnnn_
#*        dGGGGMMb
#*       @p~qp~~qMb
#*       M|@||@) M|
#*       @,----.JM|
#*      JS^\__/  qKL
#*     dZP        qKRb
#*    dZP          qKKb
#*   fZP            SMMb
#*   HZM            MMMM
#*   FqM            MMMM
#* __| ".        |\dS"qML
#* |    `.       | `' \Zq
#*_)      \.___.,|     .'
#*\____   )MMMMMP|   .'
#*     `-'       `--' hjm
#*
else

  #! --------Package Managers Part 2------------
  ##################################################
  #########  PACKAGE MANAGERS PART 2  ##############
  ##################################################

  ############
  #   Nix    #
  ############

  $HOME/Downloads/RocketOS-Bootstrap/Shared-Code/NixPackageManager-MacLinux-Part2.sh

  #Flatpak with Nix
  nix-env -iA nixpkgs.flatpak
  flatpak remote-add --system --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

  #! ----------Apps (Only to get RocketOS Going Properly)---------
  flatpak install --user --assumeyes flathub com.raggesilver.BlackBox
  nix-env -iA nixpkgs.gum
  nix-env -iA nixpkgs.git

  #Alacrity
  nix-env -iA nixpkgs.alacritty
  #sudo snap install alacritty --classic

  #StarShip
  nix-env -iA nixpkgs.starship
  #sudo snap install starship --edge

  # Powershell (The Modules will get installed with Universal-Env.ps1 script)
  nix-env -iA nixpkgs.powershell
  #sudo snap install powershell-preview --classic

  #! --------Fonts------------
  $HOME/Downloads/RocketOS-Bootstrap/Shared-Code/JetBrainsMonoFont-MacLinux.sh

fi
