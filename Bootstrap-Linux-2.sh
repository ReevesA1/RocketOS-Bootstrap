#!/bin/zsh
#Using this shbang for echo and read with color to work



#! --------Package Managers Part 2------------
##################################################
#########  PACKAGE MANAGERS PART 2  ##############
##################################################

############
#   Nix    #
############

$HOME/Downloads/RocketOS-Bootstrap/Shared-Code/NixPackageManager-MacLinux-Part2.sh


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

