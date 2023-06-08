# RocketOS-Bootstrap

# This Script is strickly to get RocketOS going!

## Windows Bootstrap

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

### Install Powershell Preview and Git

```
winget install -e --id Microsoft.PowerShell.Preview --accept-package-agreements --accept-source-agreements
winget install -e --id Git.Git --accept-package-agreements --accept-source-agreements


```

### Script 1 - Run in windows terminal powershell-preview

```
# Check if running in an elevated session
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!"
    Read-Host
    exit
}

# Check if repo exists and delete it if it does
if (Test-Path "$env:USERPROFILE\Downloads\RocketOS-Bootstrap") {
    Remove-Item -Recurse -Force "$env:USERPROFILE\Downloads\RocketOS-Bootstrap"
}

# Clone Repo
git clone https://github.com/ReevesA1/RocketOS-Bootstrap.git $env:USERPROFILE\Downloads\RocketOS-Bootstrap

# Run the Script
Invoke-Expression "$env:USERPROFILE\Downloads\RocketOS-Bootstrap\Bootstrap-Windows-1.ps1"
exit

```

### Script 2 - Install Scoop in a non admin shell

```
Write-Host "Install Scoop Package Manager ... Press Enter to continue" -ForegroundColor Green
Read-Host
Write-Output "Installing Scoop"
function Install-Scoop {
  if (-not (Test-Path "$env:USERPROFILE\scoop")) {
    # irm get.scoop.sh | iex
    Invoke-Expression (Invoke-WebRequest -Uri 'https://get.scoop.sh' -UseBasicParsing).Content
  }
  else {
    # nuget command is available, NuGet command-line utility is already installed
    Write-Output "Scoop is already installed."
  }
}
#Call Function
Install-Scoop
```

### Script 3 - After A Shell Restart

```
# Check if running in an elevated session
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!"
    Read-Host
    exit
}

# Check if repo exists and delete it if it does
if (Test-Path "$env:USERPROFILE\Downloads\RocketOS-Bootstrap") {
    Remove-Item -Recurse -Force "$env:USERPROFILE\Downloads\RocketOS-Bootstrap"
}

# Clone Repo
git clone https://github.com/ReevesA1/RocketOS-Bootstrap.git $env:USERPROFILE\Downloads\RocketOS-Bootstrap

# Run the Script
Invoke-Expression "$env:USERPROFILE\Downloads\RocketOS-Bootstrap\Bootstrap-Windows-2.ps1"
exit
```

- Windows Setup Complete - I can now navigate to RocketOS repo and run it

## Mac Bootstrap

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
  echo "\033[32mInstalling Xcode Command Line Tools... (Insert USB NOW if available) Press Enter to continue\033[0m"
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

echo "\033[32mBootstrap-Mac.sh Part 1... Press Enter to continue  \033[0m"
read
$HOME/Downloads/RocketOS-Bootstrap/Bootstrap-Mac-1.sh
exit

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

echo "\033[32mBootstrap-Mac.sh Part 2... Press Enter to continue  \033[0m"
read
$HOME/Downloads/RocketOS-Bootstrap/Bootstrap-Mac-2.sh
exit
```

- Mac Bash Setup Complete - I can now navigate to RocketOS repo and run it using Powershell

## Linux Powershell Setup Using Bash

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

```
# ---------Clone repo and launch Bootstrap-Linux-1.sh --------
echo "\033[32mCheck if repo exist and delete it before cloning it... Press Enter to continue \033[0m"
read
if [ -d "$HOME/Downloads/RocketOS-Bootstrap" ]; then
  command rm -vrf "$HOME/Downloads/RocketOS-Bootstrap"
fi

# Clone Repo
git clone https://github.com/ReevesA1/RocketOS-Bootstrap.git $HOME/Downloads/RocketOS-Bootstrap

# Give Proper Permisions To Entire Folder
find "$HOME/Downloads/RocketOS-Bootstrap/" -print0 | xargs -0 chmod 775

echo "\033[32mBootstrap-Mac.sh Part 1... Press Enter to continue  \033[0m"
read
$HOME/Downloads/RocketOS-Bootstrap/Bootstrap-Linux-1.sh
exit
```

### Script 2 - After Shell Restart

```
# ---------Clone repo and launch Bootstrap-Linux-2.sh --------
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
 $HOME/Downloads/RocketOS-Bootstrap/Bootstrap-Linux-2.sh
 exit
```

- Linux Bash Setup Complete - I can now navigate to RocketOS repo and run it using Powershell
