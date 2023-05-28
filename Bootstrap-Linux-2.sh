#!/bin/zsh
#Using this shbang for echo and read with color to work

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

# Powershell
nix-env -iA nixpkgs.powershell
#sudo snap install powershell-preview --classic

