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
  print "\033[32mXcode Command Line Tools is allready installed... Press Enter to continue\033[0m"
  read
  exit 0
fi

# Print a message in green color
print "\033[32mInstalling Xcode Command Line Tools... Press Enter to continue\033[0m"
read

# Check if the Xcode_14.3.xip file exists on the Stubby USB volume
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

# Wait for the user to press enter before exiting
echo "Press enter to exit."
read

```

```
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
