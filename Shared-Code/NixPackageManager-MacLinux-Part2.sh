#!/bin/zsh
#Using this shbang for echo and read with color to work

echo "\033[32mFinish Nix Install... Press Enter to continue  \033[0m"
read

#? Add Unstable Channel and use the unstable prefix to install apps like so `nix-env -iA unstable.gum`
#? I could actualy name it anything by changing the name unstable. The last word in the next command !!!
nix-channel --add https://nixos.org/channels/nixpkgs-unstable unstable
nix-channel --update
