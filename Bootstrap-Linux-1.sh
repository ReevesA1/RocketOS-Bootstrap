#!/bin/zsh
#Using this shbang for echo and read with color to work

#! --------Package Managers------------

#? Linux Bootstrap Flatpak & Snaps get going
#flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#snap ill have to start socket?
sudo apt install flatpak or nix-env -iA nixpkgs.flatpak
sudo apt install snapd
#! ----------Install Powershell with modules---------

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
