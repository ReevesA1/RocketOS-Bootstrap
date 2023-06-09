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

  #!Download my NixOS modules
  #TODO when I add new Modules here remember to do the same with the powershell alias rebuildnix
  sudo curl -o /etc/nixos/core-configs.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/Modules/core-configs.nix
  sudo curl -o /etc/nixos/core-packages-x86Only.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/Modules/core-packages-x86Only.nix
  sudo curl -o /etc/nixos/core-packages.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/Modules/core-packages.nix
  sudo curl -o /etc/nixos/cron.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/Modules/cron.nix
  sudo curl -o /etc/nixos/Distrobox.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/Modules/Distrobox.nix
  sudo curl -o /etc/nixos/extra-packages.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/Modules/extra-packages.nix
  sudo curl -o /etc/nixos/flatpaks.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/Modules/flatpaks.nix
  sudo curl -o /etc/nixos/Gaming.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/Modules/Gaming.nix
  sudo curl -o /etc/nixos/gnome.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/Modules/gnome.nix
  sudo curl -o /etc/nixos/kde.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/Modules/kde.nix
  sudo curl -o /etc/nixos/languages.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/Modules/languages.nix
  sudo curl -o /etc/nixos/nix-special-configs.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/Modules/nix-special-configs.nix
  sudo curl -o /etc/nixos/Nvidia.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/Modules/Nvidia.nix
  sudo curl -o /etc/nixos/Openssh.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/Modules/Openssh.nix
  sudo curl -o /etc/nixos/ProtonVPN.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/Modules/ProtonVPN.nix
  sudo curl -o /etc/nixos/SolaarLogitechMouse.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/Modules/SolaarLogitechMouse.nix
  sudo curl -o /etc/nixos/systemd-services.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/Modules/systemd-services.nix
  sudo curl -o /etc/nixos/users.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/Modules/users.nix

  #!Choose Machine
  echo "Copying NixOS Configs and rebuilding NixOS...Press Enter To Continue..."
  read
  echo "Which config would you like to curl?"
  echo "1) ROG-Laptop"
  echo "2) Ser3"
  echo "3) VirtualBox"
  echo "4) Parallels"
  echo -n "Enter your choice [1-4]: "
  read choice

  case $choice in

  #?ROG-Laptop
  1)
    sudo curl -o /etc/nixos/configuration.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/ROG-Laptop-configs.nix
    ;;
  #?Ser3
  2)
    sudo curl -o /etc/nixos/configuration.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/Ser3-configs.nix
    ;;
  #?VirtualBox
  3)
    sudo curl -o /etc/nixos/configuration.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/VirtualBox-configs.nix
    ;;
  #?Parallels
  4)
    sudo curl -o /etc/nixos/configuration.nix https://raw.githubusercontent.com/ReevesA1/RocketOS-Bootstrap/main/NixOS/Parallels-configs.nix
    ;;
  *)
    echo "Invalid choice."
    ;;
  esac

  #! Rebuild Nix
  sudo nixos-rebuild switch

  #! Restart PC
  echo "Rebooting in 5 seconds...then run part 2."
  #read #Uncomment this for debugging
  sleep 5 # I get a black screen or else so this is my way around it so it reboots on its own
  reboot  # I get a black screen or else so this is my way around it so it reboots on its own

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

      #? Flatpak Going to try with nixos (it gets installed on part 2 of this script)
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
