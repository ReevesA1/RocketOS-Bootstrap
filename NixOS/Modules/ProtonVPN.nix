{ config, pkgs, lib, ... }:
    {
  
  #!system wide packages
  environment.systemPackages = with pkgs; [


  protonvpn-cli
  #protonvpn-gui #might need this to login originaly if 2fa doesnt work but then just use protonvpn-cli - command is protonvpn-cli login [ProtonVPN username]



}

