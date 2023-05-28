#!/bin/zsh
#Using this shbang for echo and read with color to work

#! --------Package Managers------------

############
#   Nix    #
############

$HOME/Downloads/RocketOS-Bootstrap/Shared-Code/NixPackageManager-MacLinux-Part1.sh

InstallPackageManagerPerDistroFamily() {
  ID=$(grep "^ID=" /etc/*-release | cut -d= -f2 | tr -d '"')
  ID_Like=$(grep "^ID_LIKE=" /etc/*-release | cut -d= -f2 | tr -d '"')

  #!            .-/+oossssoo+/-.
  #!        `:+ssssssssssssssssss+:
  #!      -+ssssssssssssssssssyyssss+-
  #!    .ossssssssssssssssssdMMMNysssso.
  #!   /ssssssssssshdmmNNmmyNMMMMhssssss/
  #!  +ssssssssshmydMMMMMMMNddddyssssssss+
  #! /sssssssshNMMMyhhyyyyhmNMMMNhssssssss/
  #!.ssssssssdMMMNhsssssssssshNMMMdssssssss.
  #!+sssshhhyNMMNyssssssssssssyNMMMysssssss+
  #!ossyNMMMNyMMhsssssssssssssshmmmhssssssso
  #!ossyNMMMNyMMhsssssssssssssshmmmhssssssso
  #!+sssshhhyNMMNyssssssssssssyNMMMysssssss+
  #!.ssssssssdMMMNhsssssssssshNMMMdssssssss.
  #! /sssssssshNMMMyhhyyyyhdNMMMNhssssssss/
  #!  +sssssssssdmydMMMMMMMMddddyssssssss+
  #!   /ssssssssssshdmNNNNmyNMMMMhssssss/
  #!    .ossssssssssssssssssdMMMNysssso.
  #!      -+sssssssssssssssssyyyssss+-
  #!
  # Ubuntu/Debian
  if [[ "$ID" =~ ubuntu ]] || [[ "$ID_Like" =~ ubuntu ]] || [[ "$ID" =~ debian ]] || [[ "$ID_Like" =~ debian ]]; then

    #? Flatpak Going to try with nixo (it gets installed on part 2 of this script)
    #sudo apt install flatpak && flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    #! Snap
    sudo apt install snapd

    #?##
    #?####
    #?######
    #?########
    #?##########
    #?############
    #?##############
    #?################
    #?##################
    #?####################
    #?######################
    #?#########      #########
    #?##########      ##########
    #?###########      ###########
    #?##########          ##########
    #?#######                  #######
    #?####                          ####
    #?###

  # Arch
  elif [[ "$ID" =~ arch ]] || [[ "$ID_Like" =~ arch ]]; then
    #? Flatpak Going to try with nixo (it gets installed on part 2 of this script)
    #sudo pacman -S flatpak && flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    #! Snap
    git clone https://aur.archlinux.org/snapd.git
    cd snapd
    makepkg -si
    cd ~/ #back to home so it don't screw anything else up
    sudo systemctl enable --now snapd.socket
    sudo ln -s /var/lib/snapd/snap /snap

    #⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    #⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣦⡀⠒⢶⣄⠀⠀⠀⠀⠀⠀⠀
    #⠀⢰⣶⣷⣶⣶⣤⣄⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣾⣿⡆⠀⠀⠀⠀⠀⠀
    #⠀⢿⣿⣿⣿⣿⡟⢁⣄⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀
    #⠀⠘⣿⣿⣿⣿⣧⡈⠻⢷⣦⣄⡉⠛⠿⢿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀
    #⠀⠀⠈⠻⣿⣿⣿⣿⣶⣄⡈⠙⠻⢷⣶⣤⣄⣈⡉⠛⠛⠛⠃⢠⣀⣀⡀⠀⠀⠀
    #⠀⠀⠀⠀⠈⠙⠻⢿⣿⣿⣿⣿⣶⣦⣤⣍⣉⠙⠛⠛⠛⠿⠃⢸⣿⣿⣿⣷⡀⠀
    #⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⠿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣾⣿⣿⣿⣿⣿⣧⠀
    #⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠙⠛⠻⠏⠀⠉⠻⢿⣿⣿⣿⣿⠿⠋⠀
    #
  # Fedora
  elif [[ "$ID" =~ fedora ]] || [[ "$ID_Like" =~ fedora ]]; then

    #? Flatpak Going to try with nixo (it gets installed on part 2 of this script)
    #sudo yum install flatpak && flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    #! Snap
    sudo dnf install snapd
    sudo ln -s /var/lib/snapd/snap /snap

    #*############
    #*#############
    #*##NIX #######
    #*############
    #*############

  # NixOS
  elif [[ "$ID" =~ nixos ]]; then
    echo "This is NixOS"

    ###########################################################
  else
    echo "Cannot Detect Flavour"
  fi
}

# Call the function
InstallPackageManagerPerDistroFamily
