if ($IsWindows) {
  # Install Choco and Winget, ETC!!!!
  # Install Git and Gum, ETC !!!
  write-host "test windows"
}

elseif ($IsMacOS) {
  # Install Homebrew and Nix, ETC!!!
  # Install Git and Gum, ETC !!! 
  write-host "test mac"
}

elseif ($IsLinux) {
  # Detect Distro Ubuntu, Fedora, Arch, NixOS
  # Install flatpaks,Snaps,Nix ETC!!!!
  # Install Git and Gum, ETC !!!

  write-host "test linux"
}
