if ($IsWindows) {
  Invoke-Expression "$env:USERPROFILE\Downloads\RocketOS-source\setups\Universal-UpdateDotfiles.ps1"
}

elseif ($IsMacOS) {
  Invoke-Expression "$HOME/Downloads/RocketOS-source/setups/Universal-UpdateDotfiles.ps1"
}

elseif ($IsLinux) {
  Invoke-Expression "$HOME/Downloads/RocketOS-source/setups/Universal-UpdateDotfiles.ps1"
}
