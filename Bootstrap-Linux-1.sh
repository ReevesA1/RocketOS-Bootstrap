#!/bin/zsh
#Using this shbang for echo and read with color to work

#! --------Package Managers------------

InstallPackageManagerPerDistroFamily() {
  ID=$(grep "^ID=" /etc/*-release | cut -d= -f2 | tr -d '"')
  ID_Like=$(grep "^ID_LIKE=" /etc/*-release | cut -d= -f2 | tr -d '"')

  # Ubuntu/Debian
  if [[ "$ID" =~ ubuntu ]] || [[ "$ID_Like" =~ ubuntu ]] || [[ "$ID" =~ debian ]] || [[ "$ID_Like" =~ debian ]]; then
    echo "This Distro Belongs to the Ubuntu/Debian Family"
  # Arch
  elif [[ "$ID" =~ arch ]] || [[ "$ID_Like" =~ arch ]]; then
    echo "This Distro Belongs to the Arch Family"
  # Fedora
  elif [[ "$ID" =~ fedora ]] || [[ "$ID_Like" =~ fedora ]]; then
    echo "This Distro Belongs to the Fedora Family"
  # NixOS
  elif [[ "$ID" =~ nixos ]]; then
    echo "This is NixOS"
  else
    echo "Cannot Detect Flavour"
  fi
}

# Call the function
InstallPackageManagerPerDistroFamily


############
#   Nix    #
############

$HOME/Downloads/RocketOS-Bootstrap/Shared-Code/NixPackageManager-MacLinux-Part1.sh


#! --------Fonts------------
$HOME/Downloads/RocketOS-Bootstrap/Shared-Code/JetBrainsMonoFont-MacLinux.sh

