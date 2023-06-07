################################################################
##                                                            ##                                   
##                                                            ##
##                         Powershell Settings                ##                          
##                                                            ##
##                                                            ##
################################################################

#################
#ExecutionPolicy#
#################

Write-Host "Setting execution policy to RemoteSigned for the current user  ... Press Enter to continue" -ForegroundColor Green
Read-Host

$ExecutionPolicy = Get-ExecutionPolicy -Scope CurrentUser
if ($ExecutionPolicy -eq "RemoteSigned") {
  Write-Verbose "Execution policy is already set to RemoteSigned for the current user, skipping..." -Verbose
}
else {
  Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
}
# use this line to see if it worked `Get-ExecutionPolicy -List`


###################
#Package Providers#
###################
Write-Host "Set Package Providers  ... Press Enter to continue" -ForegroundColor Green
Read-Host


# use `Get-PackageProvider` to see all

# Nuget is a dependecy of PSWindowUpdate Module
if (!(Get-PackageProvider -Name NuGet -ErrorAction SilentlyContinue)) {
  Install-PackageProvider -Name NuGet -Force -Confirm:$false
}

#################
#Trusted Repo's#
#################
Write-Host "Trust Repos  ... Press Enter to continue" -ForegroundColor Green
Read-Host

#use `Get-PSRepository` to see all
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted


#######################################
####Base Windows Powershell Modules####
#######################################
Write-Host "Install Windows Exclusive Powershell Modules  ... Press Enter to continue" -ForegroundColor Green
Read-Host
#use 'Get-Module -ListAvailable' to see all remember to scroll UP!!!
#! This will only install windows specific modules, the universal ones get called in Universal-Env.ps1 script
function WindowsPowershellModules {
  $modules = @(
    "PSWindowsUpdate",
    "BurntToast"
  )

  foreach ($module in $modules) {
    if (-not (Get-Module -Name $module -ListAvailable)) {
      Write-Host -ForegroundColor Cyan "$module is not installed, installing now..."
      Install-Module -Name $module -Force
    }
    else {
      Write-Host -ForegroundColor Cyan "$module is already installed"
    }
  }
}
# Call Function
WindowsPowershellModules
# This is needed for the PSwindowsupdate module
Add-WUServiceManager -MicrosoftUpdate -Confirm:$false


################################################################
##                                                            ##                                   
##                                                            ##
##                        Package Managers                    ##                          
##                                                            ##
##                                                            ##
################################################################


Write-Host "Install Choco Package Manager ... Press Enter to continue" -ForegroundColor Green
Read-Host

# Instal Choco
Write-Output "Installing Choco"
# only if not installed
if ([bool](Get-Command -Name 'choco' -ErrorAction SilentlyContinue)) {
  Write-Verbose "Chocolatey is already installed, skip installation." -Verbose
}
else {
  Write-Verbose "Installing Chocolatey..." -Verbose
  Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}




###############################################################################################

#Choco Method - Not Tested Because winget is installed by default now
<#
Write-Host "Install Winget Package Manager ... Press Enter to continue" -ForegroundColor Green
Read-Host
Write-Output "Installing Winget"

if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
  choco install winget-cli
}
else {
  Write-Host "winget is already installed" -ForegroundColor Green
}

#>

#OLD Way
<#
# If Winget is not installed, install it
$wingetInstalled = Get-Command winget -ErrorAction SilentlyContinue
if (-not $wingetInstalled) {
  # Download the latest version of Winget from GitHub
  Invoke-WebRequest -Uri https://github.com/microsoft/winget-cli/releases/download/v0.3.3254-preview/Microsoft.DesktopAppInstaller_4.2021.3254.0_x64__8wekyb3d8bbwe.msixbundle -OutFile winget.msixbundle
  # Install the downloaded MSIX bundle
  Add-AppxPackage .\winget.msixbundle -Confirm:$false
  # Delete the downloaded file
  Remove-Item .\winget.msixbundle
}
else {
  # Winget is already installed, check for updates
  $updateAvailable = winget update check
  if ($updateAvailable) {
    # Update is available, upgrade to the latest version
    winget upgrade --all --accept-package-agreements --accept-source-agreements
  }
}
#>

###################################################################################################

#Scoop is now in the readme because it can't be installed as admin
<#
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

#>

######################################################################################################
Write-Host "Install Nuget Package Manager ... Press Enter to continue" -ForegroundColor Green
Read-Host

Write-Output "Installing Nuget" #don't think it works on windows 10
# If Nuget is not installed, install it
# FYI Nuget allows the removal of lines like this `Get-AppxPackage -AllUser -Name Microsoft.MSPaint | Remove-AppxPackage -ErrorAction SilentlyContinue # Paint3D`
#Winget version did not work 
if (-not (Get-Command -Name nuget -ErrorAction SilentlyContinue)) {
  # nuget command is not available, install NuGet command-line utility
  choco install nuget.commandline
}
else {
  # nuget command is available, NuGet command-line utility is already installed
  Write-Output "The NuGet command-line utility is already installed."
}


################################################################
##                                                            ##                                   
##                                                            ##
##                         Fonts                              ##                          
##                                                            ##
##                                                            ##
################################################################
Write-Host "Install Fonts ... Press Enter to continue" -ForegroundColor Green
Read-Host

# Jet Brains Fonts used  by my starship dotfiles so icons work in windows terminal and vscode 
# It will only install Jetbrains if not allready installed!
Write-Output "Installing jetbrains mono Fonts"
choco install nerd-fonts-jetbrainsmono -y -ia "not (Get-ItemProperty -Path 'HKCU:\Software\chocolatey\install' -Name 'nerd-fonts-jetbrainsmono')"






################################################################
##                                                            ##                                   
##                                                            ##
##                        More Update                         ##                          
##                                                            ##
##                                                            ##
################################################################
#Update Powershell help
Write-Output "Update Powershell help"
$updatehelpresponse = Read-Host "Do you want to Update Powershell help?  (Y/N)"

if ($updatehelpresponse -eq "Y") {
  # Update Powershell help
  Update-Help -ErrorAction SilentlyContinue
}
else {
  Write-Output "skipping Powershell help update"
}
################################################################
##                                                            ##                                   
##                                                            ##
##                          Restart PC                        ##                          
##                                                            ##
##                                                            ##
################################################################


# Restart PC  Yes or No 
Write-Output "Restart PC !!"
$restartresponse = Read-Host "Do you want to restart PC? (Y/N)"

if ($restartresponse -eq "Y") {
  Restart-Computer
}
else {
  Write-Output "Restart Later."
}

