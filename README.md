# RocketOS-Bootstrap

## Install Powershell

### Windows Powershell Setup

```
# Check if repo exists and delete it if it does
if (Test-Path "$env:USERPROFILE\Downloads\RocketOS-Bootstrap") {
    Remove-Item -Recurse -Force "$env:USERPROFILE\Downloads\RocketOS-Bootstrap"
}

# Clone Repo
git clone https://github.com/ReevesA1/RocketOS-Bootstrap.git $env:USERPROFILE\Downloads\RocketOS-Bootstrap

# Run the Script
& "$env:USERPROFILE\Downloads\RocketOS-Bootstrap\Windows-PowershellSetup.ps1"

```

### Mac + Linux Powershell Setup Using Bash

```
# Check if repo exist and delete it if it does
if [ -d "$HOME/Downloads/RocketOS-Bootstrap" ]; then
  command rm -vrf "$HOME/Downloads/RocketOS-Bootstrap"
fi

# Clone Repo
git clone https://github.com/ReevesA1/RocketOS-Bootstrap.git $HOME/Downloads/RocketOS-Bootstrap

# Give Proper Permisions
 find $HOME/Downloads/RocketOS-Bootstrap/Mac-PowershellSetup.sh -type f -print0 | xargs -0 chmod 775

# Run the Script
 $HOME/Downloads/RocketOS-Bootstrap/Mac-PowershellSetup.sh
```

# Once Powershell in Installed

## Run Universal Main Bootstrap Script

```


# Run the Script
if ($IsWindows) {
    # Check if repo exists and delete it if it does
    if (Test-Path "$env:USERPROFILE\Downloads\RocketOS-Bootstrap") {
        Remove-Item -Recurse -Force "$env:USERPROFILE\Downloads\RocketOS-Bootstrap"
    }

    # Clone Repo
    git clone https://github.com/ReevesA1/RocketOS-Bootstrap.git $env:USERPROFILE\Downloads\RocketOS-Bootstrap

    # Run the Script
    & "$env:USERPROFILE\Downloads\RocketOS-Bootstrap\Universal-Main-Bootstrap-Script.ps1"

} elseif ($IsMacOS -or $IsLinux) {
    # Check if repo exists and delete it if it does
    if (Test-Path "$HOME/Downloads/RocketOS-Bootstrap") {
        Remove-Item -Recurse -Force "$HOME/Downloads/RocketOS-Bootstrap"
    }

    # Clone Repo
    git clone https://github.com/ReevesA1/RocketOS-Bootstrap.git $HOME/Downloads/RocketOS-Bootstrap

    # Run the Script
    & "$HOME/Downloads/RocketOS-Bootstrap/Universal-Main-Bootstrap-Script.ps1"
}

```

# I can now navigate to RocketOS repo and run it
