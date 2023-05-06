#!/usr/bin/env bash


#? Example of calling a script 
#* Invoke-Expression "$HOME/Downloads/RocketOS-Bootstrap/Mac-PowershellSetup.sh"
#TODO Install Package Managers: Homebrew and Nix, ETC!!!
#* Check App MasterList for all package managers!!! 
#* Have a script for each package manager!!!!
#TODO Install Apps: POWERSHELL, Git and Gum, ETC !!! 
#TODO Copy Notion MAc bootstrap Template shit in here
#TODO make me choose between homebrew and nix right off the bat or install both? 

#! --------Install Xcode-----------

xcode-select --install

#! --------Package Managers------------
  
#Nix
$HOME/Downloads/RocketOS-Bootstrap/PackageManagers/Nix-Bash.sh

#! ----------Apps----------

# Nix Apps
if command -v nix-env >/dev/null; then

    # Channels
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
    nix-channel --update

    # Apps
    nix-env -iA nixpkgs.powershell

else
    echo "Nix is not installed"
fi