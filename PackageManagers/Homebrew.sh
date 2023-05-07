#!/usr/bin/env bash

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
tap "buo/cask-upgrade"
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/cask-fonts"
tap "homebrew/cask-versions"
tap "homebrew/core"
tap "buo/cask-upgrade"
