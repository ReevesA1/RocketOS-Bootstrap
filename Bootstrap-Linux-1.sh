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
#⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⠏⠀⠀⢻⣿⣿⣿⡄⠀⠀⠀⠹⣿⡿⡟⠀⠀⠀⠀⠀⠀⠀
if [ "$(grep "^ID=" /etc/*-release | cut -d= -f2 | tr -d '"')" = "nixos" ]; then

  #Add Unstable Channel
  echo "Adding unstable channel...Press Enter To Continue..."
  read
  sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
  sudo nix-channel --update

  #Install Jetbrains-Mono Fonts
  echo "Installing Jetbrains-Mono font...Press Enter To Continue..."
  read
  # Download the script
  curl -O https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/Shared-Code/JetBrainsMonoFont-MacLinux.sh
  # Make the script executable
  chmod +x JetBrainsMonoFont-MacLinux.sh
  # Run the script
  ./JetBrainsMonoFont-MacLinux.sh
  # Delete the script
  rm JetBrainsMonoFont-MacLinux.sh

  #COPY My NixOS Config to Proper folder and rebuild nix
  echo "Copying NixOS Configs and rebuilding NixOS...Press Enter To Continue..."
  read
  echo "Which config would you like to curl?"
  echo "1) ROG-Laptop"
  echo "2) Ser3"
  echo "3) VirtualBox"
  read -p "Enter your choice [1-3]: " choice

  case $choice in
  1)
    sudo curl -o /etc/nixos/configuration.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/ROG-Laptop-configs.nix
    ;;
  2)
    sudo curl -o /etc/nixos/configuration.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/Ser3-configs.nix
    ;;
  3)
    sudo curl -o /etc/nixos/configuration.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/VirtualBox-configs.nix
    ;;
  *)
    echo "Invalid choice."
    ;;
  esac

  sudo nixos-rebuild switch

  # Restart PC
  echo "Reboot...then run part 2."
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

  #May Need Zsh for linux Bootstrap
  zsh_warning() {
    if [ -n "$BASH_VERSION" ]; then
      echo -e "\033[31mWarning: I haven't tested this echo function yet but I may need to run Linux bootstrap in zsh only.\033[0m"
      read -p "Press enter to continue"
    else
      echo "Double check I am using zsh"
    fi
  }
  zsh_warning

  #! --------Package Managers------------

  ############
  #   Nix    #
  ############

  $HOME/Downloads/RocketOS-Bootstrap/Shared-Code/NixPackageManager-MacLinux-Part1.sh

  ################################
  #  Default Package Managers    #
  ################################
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
      #Update
      sudo apt update && sudo apt upgrade

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
      #Update
      sudo pacman -Syu

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
      #Update
      Sudo dnf upgrade

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

fi
