#!/bin/zsh

#? Example of calling a script
#* Invoke-Expression "$HOME/Downloads/RocketOS-Bootstrap/Mac-PowershellSetup.sh"
#TODO Install Package Managers: Homebrew and Nix, ETC!!!
#* Check App MasterList for all package managers!!!
#* Have a script for each package manager!!!!
#TODO Copy Notion MAc bootstrap Template shit in here
#* started I added xcode already
#TODO make me choose between homebrew and nix right off the bat or install both?
#TODO make nix and homebrew methods both make powershell my default shell
#TODO install icon powershell module and install homebrew

#! --------Disable Mac gate keeper-----------
echo "\033[32mDisable Mac gate keeper... Press Enter to continue  \033[0m"
read

sudo spctl --master-disable

#! --------Rosetta 2 is a translation layer -----------
echo "\033[32mInstall Rosetta 2 is a translation layer... Press Enter to continue  \033[0m"
read

/usr/sbin/softwareupdate --install-rosetta --agree-to-license

#! --------Package Managers------------

echo "\033[32mInstall Homebrew... Press Enter to continue  \033[0m"
read

$HOME/Downloads/RocketOS-Bootstrap/PackageManagers/Homebrew.sh

echo "\033[32mInstall Nix... Press Enter to continue  \033[0m"
read
$HOME/Downloads/RocketOS-Bootstrap/PackageManagers/Nix.sh


#! ----------Install Powershell with modules---------

#! ----------Apps (Only to get RocketOS Going Properly)---------
#! I will use Homebrew for this, I tried using nix but it gets complicated. Just use nix for one of apps not for the base setup

echo "\033[32mInstall Apps need to get RocketOS Going... Press Enter to continue  \033[0m"
read

brew install --cask font-jetbrains-mono #from cask-fonts Tap
brew install --cask alacritty
brew install mas
brew install gum
brew install starship

#! --------Misc------------

#Make powershell my default shell
echo "\033[32mMake powershell my default shell...Press Enter to continue \033[0m"
read

sudo chsh -s /usr/local/bin/pwsh-preview $env:USER

#! --------TESING------------
#TODO Testing put these in base-mac-env.ps1
echo "\033[32mTesting Default Writes... Press Enter to continue \033[0m"
read

# Turn natural scrolling off
defaults write -g com.apple.swipescrolldirection -bool FALSE

# Dock
defaults write com.apple.dock minimize-to-application -bool TRUE
defaults write com.apple.dock largesize -int 128 # Magnification = LARGE
killall Dock                                     # resets dock

echo "\033[32mmight have to logout and back in for default writes to work \033[0m"

#? ---------THEN END---------------
echo "\033[32mYou should now be able to launch RocketOS from the repo readme command... Press Enter to continue \033[0m"
read
