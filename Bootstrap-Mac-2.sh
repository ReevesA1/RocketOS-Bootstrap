#!/bin/zsh
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

arch -arm64 brew bundle

# Analytics
echo "\033[32mTurn off Homebrew analytics... Press Enter to continue  \033[0m"
read

brew analytics off

#Taps
brew tap buo/cask-upgrade
brew tap homebrew/cask-versions
brew tap homebrew/bundle
brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew tap homebrew/core

############
# Nix      #
############
echo "\033[32mFinish Nix Install... Press Enter to continue  \033[0m"
read

# Add Unstable Channel
nix-channel --remove nixpkgs
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update

#! Install Apps to get rocketOS Going
#########################
######  APPS  ###########
#########################

echo "\033[32mInstall Apps to get RocketOS Going... Press Enter to continue  \033[0m"
read
#! ----------Install Powershell with modules---------
brew install --cask powershell         # (Installs here /usr/local/microsoft/powershell/7/pwsh)
brew install --cask powershell-preview # from cask-versions Tap (installs here /usr/local/microsoft/powershell/7-preview/pwsh)

#! ----------Apps (Only to get RocketOS Going Properly)---------
#! I will use Homebrew for this, I tried using nix but it gets complicated. Just use nix for one of apps not for the base setup

brew install --cask alacritty
brew install mas
brew install gum
brew install starship

#! --------Fonts------------
#################################
#########  Fonts   ##############
#################################

#?JetBrains Mono must be from nerd font for everything to work so the brew command below is a no go and I must do it manualy
#brew install --cask font-jetbrains-mono #from cask-fonts Tap

#? Unfortunately, there isn’t a “latest” tag or URL that you can use to automatically download the most recent version of the JetBrains Mono Nerd Font. You will need to manually check the Nerd Fonts GitHub repository for new releases and update the download URL in the script accordingly.
# Set the download URL
Jetbrainurl="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/JetBrainsMono.zip"

# Download the font
curl -L -O $Jetbrainurl

# Unzip the downloaded file into the fonts directory
unzip -j JetBrainsMono.zip -d ~/Library/Fonts/

# Clean up
rm -rf JetBrainsMono.zip
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
read
