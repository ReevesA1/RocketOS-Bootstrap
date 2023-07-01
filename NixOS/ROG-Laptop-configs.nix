#!FYI's
# Most of these configs came from Titus https://github.com/ChrisTitusTech/nixos-titus/blob/main/configuration.nix
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).


{ config, pkgs, lib, ... }:

{
  imports =
  [ # Include the results of the hardware scan.
  ./hardware-configuration.nix
  ./core-congfigs.nix
  ./nix-special-configs.nix
  ./users.nix
  ./gnome.nix
  #./kde.nix
  ];

  ##########################################
  ###      MACHINE Exclusive OPTIONS     ###
  ##########################################
  #! Networking 
  networking.hostName = "ROG-Laptop"; 
  networking.networkmanager.enable = true;  


  #! Wayland Support
  services.xserver.displayManager.gdm.wayland = false; 

  
  #!Apps
  environment.systemPackages = with pkgs; [
  #If Im testing apps make sure to add them to core-packages.nix if I want them on all systems after


  ];








#!Waking from Suspend Commands 
#Use the command below to see if it works
#sudo journalctl -b | grep resumeCommands
powerManagement.resumeCommands = ''
  echo "Running resumeCommands test before" 
  
  echo "Running resumeCommands test after" 
'';


#!Insecure Packages 
{
  permittedInsecurePackages = [
  #Place Holder
  ];
}


#!TESTING New Options
#If Im testing new options make sure to add them to core-configs.nix if I want them on all systems after

  
}


#!Boiler Plate Stuff 
# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
system.stateVersion = "23.05"; # Did you read the comment?