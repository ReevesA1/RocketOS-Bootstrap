#! Install Apps to get rocketOS Going
#########################
######  APPS  ###########
#########################
Write-Host "Install Base Apps needed for RocketOS ... Press Enter to continue" -ForegroundColor Green
Read-Host

<#
#Powershell
Write-Output "Installing Powershell 7 Stable"
#only if not allready installed
if (-not (Get-Command -Name pwsh -ErrorAction SilentlyContinue)) {
  winget install -e --id Microsoft.PowerShell --accept-package-agreements --accept-source-agreements
}
#>


#Powershell-Preview
<#
Write-Output "Installing Powershell 7 Preview"
#this method did not always detect pwsh-preview
if (-not (Get-Command -Name pwsh-preview -ErrorAction SilentlyContinue)) {
  winget install -e --id Microsoft.PowerShell.Preview --accept-package-agreements --accept-source-agreements
}
#>
if ($PSVersionTable.PSVersion -notlike "*-preview*") {
  winget install -e --id Microsoft.PowerShell.Preview --accept-package-agreements --accept-source-agreements
} else {
  Write-Host "PowerShell Preview is already installed" -ForegroundColor Green
}


<#
#Windows Terminal
Write-Output "Installing latest windows terminal"
#only if not allready installed (to many issues with the Preview version keep using standard)
if (-not (Get-Command -Name wt -ErrorAction SilentlyContinue)) {
  winget install -e --id Microsoft.WindowsTerminal --accept-package-agreements --accept-source-agreements
}
#>

#Windows Terminal-Preview
Write-Output "Installing latest windows terminal"
#only if not allready installed (to many issues with the Preview version keep using standard)
if (-not (Get-Command -Name wt -ErrorAction SilentlyContinue)) {
  winget install -e --id Microsoft.WindowsTerminal.Preview --accept-package-agreements --accept-source-agreements
}



Write-Output "Installing Charm-Gum"
if (!(scoop list | Select-String gum)) {
  Write-Host "Installing gum..."
  scoop install charm-gum
}
else {
  Write-Host "gum is already installed."
}

# Install Starship
Write-Output "Installing Starship"
#only if not allready installed
if (-not (Get-Command -Name starship -ErrorAction SilentlyContinue)) {
  choco install starship -y
  #winget install -e --id Starship.Starship --accept-package-agreements --accept-source-agreements
}



#Install Alacritty
Write-Output "Installing Alacritty"
#only if not allready installed
if (-not (Get-Command -Name alacritty -ErrorAction SilentlyContinue)) {
  choco install alacritty -y
  #winget install -e --id Alacritty.Alacritty --accept-package-agreements --accept-source-agreements
}

#Install Git
Write-Output "Installing Git"
#only if not allready installed
if (-not (Get-Command -Name git -ErrorAction SilentlyContinue)) {
  winget install -e --id Git.Git --accept-package-agreements --accept-source-agreements
}

#? ---------THEN END---------------
#################################
#########  TH END   ##############
#################################
Write-Host "RESTART PC FOR EVERYTHING TO WORK" -ForegroundColor Green
Write-Host "THEN RUN RocketOS (from the repo readme command)... Press Enter to continue" -ForegroundColor Green
Read-Host
