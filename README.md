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

# Windows Bootstrap

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

# Mac Bootstrap

```
# ---------Installs Xcode Command Line Tools--------
# Check if Xcode is already installed
if xcode-select -p 1>/dev/null; then
  echo "\033[32mXcode Command Line Tools is allready installed... Press Enter to exit\033[0m"
  read
  exit
fi

# Print a message in green color
echo "\033[32mInstalling Xcode Command Line Tools... Press Enter to continue\033[0m"
read

# Check if the Xcode Command Line tool file exists on the Stubby USB volume
if [ -f "/Volumes/Stubby/Xcode_Command_Line_Tools.dmg" ]; then

  echo "\033[32mInstalling from usb drive... Press Enter to continue\033[0m"
  read

  # Mount the disk image
  hdiutil attach /Volumes/Stubby/Xcode_Command_Line_Tools.dmg

  # Install the package
  sudo installer -pkg /Volumes/Command\ Line\ Developer\ Tools/Command\ Line\ Tools.pkg -target / -verboseR

  # Unmount the disk image
  hdiutil detach /Volumes/Command\ Line\ Developer\ Tools

else
  echo "\033[32mWarnin 30min Downloading and Installing from internet... Press Enter to continue\033[0m"
  read
  xcode-select --install
fi


# ---------Clone repo and launch Bootstrap-Mac.sh --------
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
```

### Linux Powershell Setup Using Bash

```
# ---------Clone repo and launch Bootstrap-Linux.sh --------
echo "\033[32mCheck if repo exist and delete it before cloning it... Press Enter to continue \033[0m"
read
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
