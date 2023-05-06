#Nix Package Manager Multi-User install 

# Check if the script is being run with admin privileges
if ([System.Environment]::UserName -eq "root") {
  Write-Host "Error: This script should not be run with admin privileges" -ForegroundColor Red
  exit 1
}

# Install Multi-User Nix Package Manager Non-Interactivily with the --yes flag only if nix is not installed
# Powershell needs to call Bash Here to install Nix
if (!(Get-Command nix -ErrorAction SilentlyContinue)) {
  if ($IsMacOS) {
    bash -c "sh <(curl -L https://nixos.org/nix/install)"
  }
  elseif ($IsLinux) {
    bash -c "sh <(curl -L https://nixos.org/nix/install) --daemon --yes"
  }
  else {
    Write-Host "Nix is not supported on this operating system"
  }
}
else {
  Write-Host "Nix is already installed"
}


# Allow unfree Software only if line doesnt exist already or if folder doesnt exist
if (Test-Path $HOME/.config/nixpkgs/config.nix) {
  $LINE = '{ allowUnfree = true; }'
  if (!(Select-String -Path $HOME/.config/nixpkgs/config.nix -Pattern $LINE)) {
    Add-Content $HOME/.config/nixpkgs/config.nix $LINE
  }
}
else {
  New-Item -ItemType Directory -Force -Path $HOME/.config/nixpkgs | Out-Null
  Set-Content $HOME/.config/nixpkgs/config.nix '{ allowUnfree = true; }'
}

# Get desktop-icons to work by appending to $Profile - not on MacOS tho and only if the line is not there already
# FYI I will always need to log out and log back in for them to appear in launcher
if ($env:OS -ne "darwin") {
  $LINE = 'export XDG_DATA_DIRS=$HOME/.nix-profile/share:$HOME/.share:"${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}"'
  if (!(Select-String -Path $HOME/.profile -Pattern $LINE)) {
    Add-Content $HOME/.profile $LINE
  }
}

# Print a success message in green text
Write-Host "Success: Install Apps in a new terminal and remember to Log out and Log back in to see them appear launcher" -ForegroundColor Green