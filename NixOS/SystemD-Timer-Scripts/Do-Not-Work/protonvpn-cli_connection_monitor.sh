#!/usr/bin/env bash

# FYI THIS DOES NOT WORK ON KDE - I could not figure out how to export this dynamically "dbus-launch --auto-syntax"
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
export $(dbus-launch)
#eval $(dbus-launch --sh-syntax)

# Check the output of the protonvpn-cli status command for the word "Canada"
# The \b in the regular expression represents a word boundary, ensuring that only the exact word "Canada" is matched
if [[ $(protonvpn-cli status) =~ \bCanada\b ]]; then
  # If "Canada" is found, display a success message
  echo -e "Ping succeeded. You have an internet connection! \U1F44D"
else
  # If "Canada" is not found, display a failure message
  protonvpn-cli connect --cc CA && protonvpn-cli ks --permanent && echo -e "ProtonVPN-cli_connection_monitor.ps1 reconnection job ran! \nRECONNECTED TO VPN!!! \U1F44D"
fi
