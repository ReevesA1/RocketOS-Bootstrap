#!/bin/zsh

# This script installs Homebrew and sets up the necessary environment variables

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to the PATH
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>/Users/rocket/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install dependencies using brew bundle
arch -arm64 brew bundle

# Turn off Homebrew analytics
brew analytics off

# Add Homebrew taps
brew tap buo/cask-upgrade
brew tap homebrew/cask-versions
brew tap homebrew/bundle
brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew tap homebrew/core
