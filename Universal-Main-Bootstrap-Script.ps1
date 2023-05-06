#? Install Powershell on all windows mac and linux
#* #? Install Powershershell-Preview with snap or build???? (arm can't do snaps but build only works on ubuntu and no preview so is nix the answer?) 
#? Example of calling a script 
#* Windows Invoke-Expression "$env:USERPROFILE\Downloads\RocketOS-Bootstrap\Windows-PowershellSetup.ps1"
#* Mac & Linux  Invoke-Expression "$HOME/Downloads/RocketOS-Bootstrap/Mac-PowershellSetup.sh"
#? Run GumRocketOS (sign in to github to get it going)
#* Do I still need base and full scripts?

############################################################################################################

if ($IsWindows) {
  #TODO Install Package Managers: Choco and Winget, ETC!!!!
    #* Check App MasterList for all package managers!!!
    #* Have a script for each package manager!!!! 
  #TODO Install Apps: POWERSHELL, Git and Gum, ETC !!!

}

elseif ($IsMacOS) {
  #TODO Install Package Managers: Homebrew and Nix, ETC!!!
    #* Check App MasterList for all package managers!!! 
    #* Have a script for each package manager!!!!
  #TODO Install Apps: POWERSHELL, Git and Gum, ETC !!! 


}

elseif ($IsLinux) {
  #TODO Detect Distro Ubuntu, Fedora, Arch, NixOS
    #* Check App MasterList for all package managers!!! 
    #* Have a script for each package manager!!!!
  #TODO Install Package managers according to distro: flatpaks,Snaps,Nix ETC!!!!
  #TODO Install Apps: POWERSHELL, Git and Gum, ETC !!!

}



