# RocketOS-Bootstrap

## Purpose

- This Script is strickly to get RocketOS going!

## FYI's and Questions?

- Installing Powershershell Caviats
  - arm
    - can't do snaps
    - building it from source only works on ubuntu and no preview version
    - so is nix the answer?
  - Mac using homebrew because of preview version and if installed using nix then alacritty can't find pwsh or jetbrain fonts for that matter
  - Linux try nix?

### Windows Powershell Setup

```
# Check if repo exists and delete it if it does
if (Test-Path "$env:USERPROFILE\Downloads\RocketOS-Bootstrap") {
    Remove-Item -Recurse -Force "$env:USERPROFILE\Downloads\RocketOS-Bootstrap"
}

# Clone Repo
git clone https://github.com/ReevesA1/RocketOS-Bootstrap.git $env:USERPROFILE\Downloads\RocketOS-Bootstrap

# Run the Script
Invoke-Expression "$env:USERPROFILE\Downloads\RocketOS-Bootstrap\Bootstrap-Windows.ps1"

```

### Mac Powershell Setup Using Bash

- Install Xcode Command Line Tools - Code below
  - For some reason it wasn't playng nice having all these as comments in zsh so I put them here as bullet points
    - Check if the .xip file exists on usb stick and install xcode from there
    - Extract the .xip file (to big to keep the unziped version on my stick 23 GB so keep it zipped)
    - I must cd cause xip will not alow to choose output directory
    - if it doesn't find it on usb it downloads and Install the Xcode Command Line Tools
    - then the scirpt continues at -----Repo------

```

print -P "\033[32mInstall Xcode Command Line Tools  \033[0m"
sleep 3

if [ -f "/Volumes/Stubby/Xcode_14.3.xip" ]; then

    cd /Applications
    xip -x "/Volumes/Stubby/Xcode_14.3.xip"
    sudo xcodebuild -runFirstLaunch
else
    xcode-select --install
fi

# -------- Repo-----------

echo -e "\033[32mCheck if repo exist and delete it before cloning it  \033[0m"
read -p "Press Enter to continue"
if [ -d "$HOME/Downloads/RocketOS-Bootstrap" ]; then
  command rm -vrf "$HOME/Downloads/RocketOS-Bootstrap"
fi

# Clone Repo
git clone https://github.com/ReevesA1/RocketOS-Bootstrap.git $HOME/Downloads/RocketOS-Bootstrap

# Give Proper Permisions To Entire Folder
find "$HOME/Downloads/RocketOS-Bootstrap/" -print0 | xargs -0 chmod 775


echo -e "\033[32mRun the Script  \033[0m"
read -p "Press Enter to continue"
 $HOME/Downloads/RocketOS-Bootstrap/Bootstrap-Mac.sh
```

### Linux Powershell Setup Using Bash

```
# Check if repo exist and delete it if it does
if [ -d "$HOME/Downloads/RocketOS-Bootstrap" ]; then
  command rm -vrf "$HOME/Downloads/RocketOS-Bootstrap"
fi

# Clone Repo
git clone https://github.com/ReevesA1/RocketOS-Bootstrap.git $HOME/Downloads/RocketOS-Bootstrap

# Give Proper Permisions To Entire Folder
find "$HOME/Downloads/RocketOS-Bootstrap/" -print0 | xargs -0 chmod 775

# Run the Script
 $HOME/Downloads/RocketOS-Bootstrap/Bootstrap-Linux.sh
```

# I can now navigate to RocketOS repo and run it
