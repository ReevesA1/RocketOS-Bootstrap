#!/usr/bin/env zsh
#Using this shbang for echo and read with color to work

#############
## Settings ##
##############

#! --------Disable Mac gate keeper-----------
echo "\033[32mDisable Mac gate keeper... Press Enter to continue  \033[0m"
read

sudo spctl --master-disable

#! --------Rosetta 2 is a translation layer -----------
echo "\033[32mInstall Rosetta 2 is a translation layer... Press Enter to continue  \033[0m"
read

/usr/sbin/softwareupdate --install-rosetta --agree-to-license

#! --------Package Managers Part 1------------
##################################################
#########  PACKAGE MANAGERS PART 1  ##############
##################################################

############
# Homebrew #
############
echo "\033[32mInstall Homebrew... Press Enter to continue  \033[0m"
read

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to the PATH
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>$HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

############
#   Nix    #
############

$HOME/Downloads/RocketOS-Bootstrap/Shared-Code/NixPackageManager-MacLinux-Part1.sh
