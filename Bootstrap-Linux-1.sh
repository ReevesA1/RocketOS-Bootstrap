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
#################################
#########  Fonts   ##############
#################################

#? Unfortunately, there isn’t a “latest” tag or URL that you can use to automatically download the most recent version of the JetBrains Mono Nerd Font. You will need to manually check the Nerd Fonts GitHub repository for new releases and update the download URL in the script accordingly.
# Set the download URL
Jetbrainurl="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/JetBrainsMono.zip"

# Download the font
curl -L -O $Jetbrainurl

# Unzip the downloaded file into the fonts directory
unzip -j JetBrainsMono.zip -d ~/.local/share/fonts

# Clean up
rm -rf JetBrainsMono.zip
