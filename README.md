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

## TO DO

- Windows

  - Example of calling a script
    - Invoke-Expression "$env:USERPROFILE\Downloads\RocketOS-Bootstrap\Windows-PowershellSetup.ps1"
  - Install Package Managers: Choco and Winget, ETC!!!!
  - Check App MasterList for all package managers!!!
  - Have a script for each package manager!!!!
  - Install Apps: POWERSHELL, Git and Gum, ETC !!!

- Mac

  - Example of calling a script
    - Invoke-Expression "$HOME/Downloads/RocketOS-Bootstrap/Mac-PowershellSetup.sh"
  - Install Package Managers: Homebrew and Nix, ETC!!!
  - Check App MasterList for all package managers!!!
  - Have a script for each package manager!!!!
  - Copy Notion MAc bootstrap Template shit in here
    - started I added xcode already
  - Get more default writes

- Linux

  - Example of calling a script
    - Invoke-Expression "$HOME/Downloads/RocketOS-Bootstrap/Mac-PowershellSetup.sh"
  - Detect Distro Ubuntu, Fedora, Arch, NixOS
  - Check App MasterList for all package managers!!!
  - Have a script for each package manager!!!!
  - Install Package managers according to distro: flatpaks,Snaps,Nix ETC!!!!
  - Nix will have two ways!!!!!!!!!!!!!
  - Install Apps: POWERSHELL, Git and Gum, ETC !!!
  - Make sure to Install oh-my-zsh (in readme like mac os?)

# Windows Bootstrap

`````
#?                   .oodMMMMMMMMMMMMM
#?       ..oodMMM  MMMMMMMMMMMMMMMMMMM
#? oodMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM
#? MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM
#? MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM
#? MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM
#? MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM
#? MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM
#?
#? MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM
#? MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM
#? MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM
#? MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM
#? MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM
#? `^^^^^^MMMMMMM  MMMMMMMMMMMMMMMMMMM
#?       ````^^^^  ^^MMMMMMMMMMMMMMMMM
#?
`````

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
#                       .888
#                     .8888'
#                    .8888'
#                    888'
#                    8'
#       .88888888888. .88888888888.
#    .8888888888888888888888888888888.
#  .8888888888888888888888888888888888.
# .&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'
# &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'
# &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.
# `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.
# `00000000000000000000000000000000000'
#  `000000000000000000000000000000000'
#   `0000000000000000000000000000000'
#     `###########################'
#       `#######################'
#         `#########''########'
#
```

### Script 1 - Install package managers and restart shell

```
# ---------Installs Xcode Command Line Tools--------
# Check if Xcode is already installed
if xcode-select -p 1>/dev/null; then
  echo "\033[32mXcode Command Line Tools is already installed... Press Enter to continue\033[0m"
  read
else
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
fi

# ---------Clone repo and launch Bootstrap-Mac-1.sh --------
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
$HOME/Downloads/RocketOS-Bootstrap/Bootstrap-Mac-1.sh

```

### Script 2 - After Shell Restart

```
# ---------Clone repo and launch Bootstrap-Mac-2.sh --------
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
$HOME/Downloads/RocketOS-Bootstrap/Bootstrap-Mac-2.sh
```

### Script 3 - Install oh-my-zsh

```
#! install oh-my-zsh (no homebrew for it)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

```

# Linux Powershell Setup Using Bash

```
#*    _nnnn_
#*        dGGGGMMb
#*       @p~qp~~qMb
#*       M|@||@) M|
#*       @,----.JM|
#*      JS^\__/  qKL
#*     dZP        qKRb
#*    dZP          qKKb
#*   fZP            SMMb
#*   HZM            MMMM
#*   FqM            MMMM
#* __| ".        |\dS"qML
#* |    `.       | `' \Zq
#*_)      \.___.,|     .'
#*\____   )MMMMMP|   .'
#*     `-'       `--' hjm
#*
```

### Script 1 - Install package managers and restart shell

- Flatpaks Snaps ETC,
- do a script 1 and a script 2 like mac
- look at todo's above

### Script 2 - After Shell Restart

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

### Script 3 - Install oh-my-zsh

- is it the same command as mac above?

# I can now navigate to RocketOS repo and run it
