#! If I wanted to do the entire MEGASync folder (FYI ONLY DOES BASH)
#Get-ChildItem -Path $HOME/MEGAsync -Recurse -Filter *.sh |
#    Where-Object { $_.FullName -notlike "$HOME/MEGAsync/Backups/*" } |
#    ForEach-Object {
#        Write-Host "Making $($_.FullName) executable"
#        chmod +x $_.FullName
#    }

#! do only systemD timers directory

Get-ChildItem -Path $HOME/MEGAsync/Scripts/SystemD-Timers -Include *.sh, *.ps1 -Recurse |
ForEach-Object {
  Write-Host "Making $($_.FullName) executable"
  chmod +x $_.FullName
}

Write-Host "make-systemd-timer-scripts-execuable.ps1`u{1F44D}" -ForegroundColor Green