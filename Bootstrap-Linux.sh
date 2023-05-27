#!/bin/zsh
#Using this shbang for echo and read with color to work

#! --------Package Managers------------

#? Linux Bootstrap Flatpak & Snaps get going
#flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#snap ill have to start socket?
sudo apt install flatpak
sudo apt install snapd
#! ----------Install Powershell with modules---------

#! ----------Apps (Only to get RocketOS Going Properly)---------

#!SORT 
- Fonts $(sudo dnf install jetbrains-mono-fonts.noarch) then I have to manualy choose fonts in some terminals
- $(sudo apt install conky-all) or nix-env -iA nixpkgs.conky
- $(nix-env -iA nixpkgs.gum)
- $(nix-env -iA nixpkgs.alacritty)
- why not snaps???? $(sudo snap install alacritty --classic)
- Ubuntu
- $(sudo apt update && sudo apt upgrade)
- $(sudo add-apt-repository ppa:aslatter/ppa -y)
- $(sudo apt install alacritty)
- if Gnome
- $(flatpak install flathub ca.desrt.dconf-editor)
- $(flatpak install flathub com.mattjakeman.ExtensionManager)

nix-env -iA nixpkgs.lsb-release #instead of #sudo apt install lsb-release #paru lsb-release #sudo dnf install redhat-lsb-core
