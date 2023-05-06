#!/usr/bin/env bash


#? Example of calling a script 
#* Invoke-Expression "$HOME/Downloads/RocketOS-Bootstrap/Mac-PowershellSetup.sh"
#TODO Install Package Managers: Homebrew and Nix, ETC!!!
#* Check App MasterList for all package managers!!! 
#* Have a script for each package manager!!!!
#TODO Install Apps: POWERSHELL, Git and Gum, ohmyzsh, ETC !!! 
#TODO Copy Notion MAc bootstrap Template shit in here
#* started I added xcode already 
#TODO make me choose between homebrew and nix right off the bat or install both? 
#TODO make nix and homebrew methods both make powershell my default shell 


#! --------Install Xcode-----------

xcode-select --install

#! --------Package Managers------------
  
#Nix
$HOME/Downloads/RocketOS-Bootstrap/PackageManagers/Nix-Bash.sh
$HOME/Downloads/RocketOS-Bootstrap/PackageManagers/Homebrew.sh

#! ----------Apps for RocketOS and Terminal to work----------

echo "Please choose an option:"
echo "1) Homebrew as Base"
echo "2) Nix as Base"
read -p "Enter your choice (1 or 2): " choice

# HOMEBREW Base
if [[ $choice == "1" ]]; then
    echo "You selected Homebrew as Base"



# NIX Base
elif [[ $choice == "2" ]]; then
    echo "You selected Nix as Base"
    if command -v nix-env >/dev/null; then
        # Channels
        nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
        nix-channel --update

        # Apps (no need for nix-env -iA nixpkgs-unstable.packageName)
        nix-env -iA nixpkgs.powershell
        nix-env -iA nixpkgs.mas
        nix-env -iA nixpkgs.gum




    else
        echo "Nix is not installed or I must source the terminal"
    fi
else
    echo "Invalid choice"
fi