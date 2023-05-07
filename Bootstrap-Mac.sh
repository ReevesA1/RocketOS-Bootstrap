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
#TODO install icon powershell module and install homebrew


#! --------Disable Mac gate keeper-----------

sudo spctl --master-disable


#! --------Install Xcode-----------

xcode-select --install


#! --------Package Managers------------
  
#Nix
$HOME/Downloads/RocketOS-Bootstrap/PackageManagers/Nix-Bash.sh
$HOME/Downloads/RocketOS-Bootstrap/PackageManagers/Homebrew-Bash.sh

#! ----------Apps (Only to get RocketOS Going)---------


    if command -v nix-env >/dev/null; then
        # Channels
        nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
        nix-channel --update

        # Apps (no need for nix-env -iA nixpkgs-unstable.packageName)
        nix-env -iA nixpkgs.powershell
        nix-env -iA nixpkgs.mas
        nix-env -iA nixpkgs.gum
        nix-env -iA nixpkgs.alacritty
        nix-env -iA nixpkgs.jetbrains-mono
        nix-env -iA nixpkgs.starship

        # Append to Powershell $profile so it can see nix apps
        mkdir -p $HOME/.config/powershell && echo '`n$env:PATH += ":/nix/var/nix/profiles/default/bin/"' >> $HOME/.config/powershell/profile.ps1 





    echo "You should now be able to launch RocketOS from the repo readme!"
    read -p "Press Enter to continue"
