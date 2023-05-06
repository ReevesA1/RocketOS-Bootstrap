# RocketOS-Bootstrap

## FYI's

- Install Powershell on all windows mac and linux
  - Install Powershershell-Preview with snap or build???? (arm can't do snaps but build only works on ubuntu and no preview so is nix the answer?)
- Do I still need base and full scripts in RockOS?

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

```
# Check if repo exist and delete it if it does
if [ -d "$HOME/Downloads/RocketOS-Bootstrap" ]; then
  command rm -vrf "$HOME/Downloads/RocketOS-Bootstrap"
fi

# Clone Repo
git clone https://github.com/ReevesA1/RocketOS-Bootstrap.git $HOME/Downloads/RocketOS-Bootstrap

# Give Proper Permisions
 find $HOME/Downloads/RocketOS-Bootstrap/Bootstrap-Mac.sh -type f -print0 | xargs -0 chmod 775

# Run the Script
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

# Give Proper Permisions
 find $HOME/Downloads/RocketOS-Bootstrap/Bootstrap-Mac.sh -type f -print0 | xargs -0 chmod 775

# Run the Script
 $HOME/Downloads/RocketOS-Bootstrap/Bootstrap-Linux.sh
```

# I can now navigate to RocketOS repo and run it
