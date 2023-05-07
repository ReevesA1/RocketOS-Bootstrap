#!/usr/bin/env bash

#? Example of calling a script
#* Invoke-Expression "$HOME/Downloads/RocketOS-Bootstrap/Mac-PowershellSetup.sh"
#TODO Install Package Managers: Homebrew and Nix, ETC!!!
#* Check App MasterList for all package managers!!!
#* Have a script for each package manager!!!!
#TODO Install Apps: POWERSHELL
#* powershell
#* mas
#* gum
#* alacritty
#* jetbrains-mono
#* starship
#* oh-my-zsh
#TODO Copy Notion MAc bootstrap Template shit in here
#* started I added xcode already
#TODO make me choose between homebrew and nix right off the bat or install both?
#TODO make nix and homebrew methods both make powershell my default shell
#TODO install icon powershell module and install homebrew

#! --------Disable Mac gate keeper-----------

sudo spctl --master-disable

#! --------Install Xcode-----------

xcode-select --install

#! --------Package Managers------------

#Nix
$HOME/Downloads/RocketOS-Bootstrap/PackageManagers/Nix.sh
$HOME/Downloads/RocketOS-Bootstrap/PackageManagers/Homebrew.sh

#! ----------Apps (Only to get RocketOS Going)---------
#! I will use Homebrew for this, I tried using nix but it gets complicated. Just use nix for one of apps not for the base setup

echo "You should now be able to launch RocketOS from the repo readme!"
read -p "Press Enter to continue"
