#! FYI THIS DOES NOT WORK ON KDE - I could not figure out how to export this dynamicaly "dbus-launch --auto-syntax"
$env:DBUS_SESSION_BUS_ADDRESS = "unix:path=/run/user/1000/bus"

# Check the output of the protonvpn-cli status command for the word "Canada"
# The \b in the regular expression represents a word boundary, ensuring that only the exact word "Canada" is matched
if ((protonvpn-cli status) | Select-String -Pattern "\bCanada\b") {
    # If "Canada" is found, display a success message
    Write-Host "Ping succeeded. You have an internet connection!" && Write-Host ([char]0xD83D + [char]0xDC4D) -ForegroundColor Green
} else {
    # If "Canada" is not found, display a failure message
    protonvpn-cli connect --cc CA && protonvpn-cli ks --permanent && Write-Host "ProtonVPN-cli_connection_monitor.ps1 reconnection job ran!" && Write-Host "RECONNECTED TO VPN!!!" && Write-Host ([char]0xD83D + [char]0xDC4D) -ForegroundColor Green
}



