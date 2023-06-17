#!/usr/bin/env zsh
#Using this shbang for echo and read with color to work

#! --------Package Managers Part 2------------
##################################################
#########  PACKAGE MANAGERS PART 2  ##############
##################################################

############
# Homebrew #
############

#dependencies
echo "\033[32mFinish Homebrew Install... Press Enter to continue  \033[0m"
read

# Analytics
echo "\033[32mTurn off Homebrew analytics... Press Enter to continue  \033[0m"
read
brew analytics off

#Taps
echo "\033[32mTaping more Brews... Press Enter to continue  \033[0m"
read

brew tap buo/cask-upgrade
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

# Brew Doctor Command tells me these are unecessary
#brew tap homebrew/cask
#brew tap homebrew/core

# [DEPRECATED] - Commands for old Ansible Brew Bundle Method
#arch -arm64 brew bundle
#brew tap homebrew/bundle

############
#   Nix    #
############

$HOME/Downloads/RocketOS-Bootstrap/Shared-Code/NixPackageManager-MacLinux-Part2.sh

#! Install Apps to get rocketOS Going
#########################
######  APPS  ###########
#########################

echo "\033[32mInstall Apps to get RocketOS Going... Press Enter to continue  \033[0m"
read
#! ----------Install Powershell ---------
# The Modules will get installed with Universal-Env.ps1 script
brew install --cask powershell         # (Installs here /usr/local/microsoft/powershell/7/pwsh)
brew install --cask powershell-preview # from cask-versions Tap (installs here /usr/local/microsoft/powershell/7-preview/pwsh)

#! ----------Apps (Only to get RocketOS Going Properly)---------
#! I will use Homebrew for this, I tried using nix but it gets complicated. Just use nix for one of apps not for the base setup

brew install --cask alacritty
brew install mas
brew install gum
brew install starship

#! --------Fonts------------
$HOME/Downloads/RocketOS-Bootstrap/Shared-Code/JetBrainsMonoFont-MacLinux.sh

#! --------Misc------------
#################################
#########  Misc    ##############
#################################

#Make powershell my default shell
echo "\033[32mMake powershell my default shell...Press Enter to continue \033[0m"
read

chsh -s /usr/local/bin/pwsh-preview

#? ---------THEN END---------------
#################################
#########  TH END   ##############
#################################
echo "\033[31mRESTART PC FOR EVERYTHING TO WORK \033[0m"
echo "\033[32mTHEN RUN RocketOS (from the repo readme command)... Press Enter to continue \033[0m"
echo "\033[32mAlso FYI Moving forward everything is done in powershell no more BASH & ZSH \033[0m"
read
