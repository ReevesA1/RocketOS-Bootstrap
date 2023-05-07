#!/usr/bin/env bash

if xcode-select -p 1>/dev/null; then
  print "\033[32mXcode Command Line Tools is already installed... Press Enter to continue\033[0m"
  read
else
  # Print a message in green color
  print "\033[32mInstalling Xcode Command Line Tools... Press Enter to continue\033[0m"
  read

  # Check if the Xcode_14.3.xip file exists on the Stubby volume
  if [ -f "/Volumes/Stubby/Xcode_14.3.xip" ]; then
    # Change directory to /Applications
    cd /Applications

    # Extract the Xcode_14.3.xip file
    xip -x "/Volumes/Stubby/Xcode_14.3.xip"

    # Run xcodebuild with the -runFirstLaunch option
    sudo xcodebuild -runFirstLaunch
  else
    # Install Xcode Command Line Tools using xcode-select
    xcode-select --install
  fi
fi

# -------- Repo-----------

echo "\033[32mCheck if repo exist and delete it before cloning it... Press Enter to continue \033[0m"
read
if [ -d "$HOME/Downloads/RocketOS-Bootstrap" ]; then
  command rm -vrf "$HOME/Downloads/RocketOS-Bootstrap"
fi

# Clone Repo
git clone https://github.com/ReevesA1/RocketOS-Bootstrap.git $HOME/Downloads/RocketOS-Bootstrap

# Give Proper Permisions To Entire Folder
find "$HOME/Downloads/RocketOS-Bootstrap/" -print0 | xargs -0 chmod 775

echo "\033[32mRun Bootstrap-Mac.sh... Press Enter to Continue  \033[0m"
read
$HOME/Downloads/RocketOS-Bootstrap/Bootstrap-Mac.sh
