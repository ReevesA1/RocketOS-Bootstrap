#!/bin/zsh
#Using this shbang for echo and read with color to work

echo "\033[32mInstall Nix... Press Enter to continue  \033[0m"
read

#Nix Package Manager Multi-User install

# Check if the script is being run with sudo
if [ "$EUID" -eq 0 ]; then
  echo -e "\033[31mError: This script should not be run with sudo\033[0m"
  exit 1
fi

# Install Multi-User Nix Package Manager Non-Interactivily only if its not installed
if ! command -v nix >/dev/null; then
  if [[ "$(uname)" == "Darwin" ]]; then
    sh <(curl -L https://nixos.org/nix/install)
  else
    sh <(curl -L https://nixos.org/nix/install) --daemon
  fi
else
  echo "Nix is already installed"
fi

# Allow unfree Software only if line doesnt exist already or if folder doesnt exist
if [ -e ~/.config/nixpkgs/config.nix ]; then
  LINE='{ allowUnfree = true; }'
  if ! grep -Fxq "$LINE" ~/.config/nixpkgs/config.nix; then
    echo "$LINE" >>~/.config/nixpkgs/config.nix
  fi
else
  mkdir -p ~/.config/nixpkgs
  echo '{ allowUnfree = true; }' >~/.config/nixpkgs/config.nix
fi

# Get desktop-icons to work by appending to $Profile - not on MacOS tho and only if the line is not there already
# FYI I will always need to log out and log back in for them to appear in launcher
if [[ "$OSTYPE" != "darwin"* ]]; then
  LINE='export XDG_DATA_DIRS=$HOME/.nix-profile/share:$HOME/.share:"${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}"'
  if ! grep -Fxq "$LINE" ~/.profile; then
    echo "$LINE" >>~/.profile
  fi
fi

echo "\033[32mRestart Shell and Run Bootstrap-Mac-2.sh Script \033[0m"
read

#! Remember there is a part 2 to this after resetting the shell to install unstable channel etc
