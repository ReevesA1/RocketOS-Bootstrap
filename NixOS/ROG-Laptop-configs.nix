#!FYI's
# Most of these configs came from Titus https://github.com/ChrisTitusTech/nixos-titus/blob/main/configuration.nix
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).


{ config, pkgs, lib, ... }:

{
  imports =
  [ 
  #!Required
  ./hardware-configuration.nix # Include the results of the hardware scan. This file is created by default.
  ./nix-special-configs.nix
  ./core-configs.nix
  ./core-packages.nix
  ./core-packages-x86Only.nix
  ./users.nix
  ./systemd-services.nix
  ./cron.nix


  #! Optional
  #Gnome
  ./gnome.nix
  ./flatpaks-gnome.nix

  #KDE
  #./kde.nix
  #./flatpaks.nix

  #Apps with extra configs
  ./extra-packages.nix
  ./Gaming.nix
  ./languages.nix
  ./Distrobox.nix
  ./Nvidia.nix
  #./Openssh.nix
  #./SolaarLogitechMouse.nix


  ];

#?#########################################
#?##      MACHINE Exclusive OPTIONS     ###
#?#########################################

#!Bootloader
  #SystemD
  boot.loader.systemd-boot.enable = true; #this is the preferred way instead of grub and for sure needed for Parallels
  boot.loader.efi.canTouchEfiVariables = true; # this is usefule if I ever dual boot
  #Grub
  #boot.loader.grub.enable = true; #Needed if in a vm with virtualbox
  #boot.loader.grub.device = "/dev/sda";  #Needed if in a vm with virtualbox
  #boot.loader.grub.useOSProber = true;  #Needed if in a vm with virtualbox


#! Networking 
networking.hostName = "ROG-Laptop-NixOS"; 

#! Wayland Support
#Gnome Wayland
services.xserver.displayManager.gdm.wayland = false;  # wayland is better for parallels but not virtualbox also wayland no good for barrier or synergy yet!!!
#KDE Wayland
#services.xserver.displayManager.defaultSession = "plasmawayland"; # wayland is better for parallels but not virtualbox also wayland no good for barrier or synergy yet!!!

#!Waking from Suspend Commands 
#Use the command below to see if it works
#sudo journalctl -b | grep resumeCommands
#testing to see if shutdown -c will help with pc rebooting after resuming from suspend
powerManagement.resumeCommands = ''
  echo "Running resumeCommands test before" 
  shutdown -c
  echo "Running resumeCommands test after" 
'';


#!SystemD Servcies
#Place Holder

#!Crons
#? to view use these commands
#sudo cat /etc/crontab #*best one
#crontab -l
#sudo crontab -u rocket -l
services.cron = {
  #enable = true;#gets enabled in core-configs.nix
  systemCronJobs = [
    "0 8 * * * $HOME/MEGAsync/Scripts/Crons/github-repo-backups.sh"
    "0 18 * * * $HOME/MEGAsync/Scripts/Crons/github-repo-backups.sh"
    "15 8 * * 1 pwsh -c 'Get-ChildItem \"$HOME/MEGAsync/Backups/cron-backups/github-backups\" -Directory | Where-Object { $_.Name -notlike \"*.zip\" } | ForEach-Object { Compress-Archive -Path $_.FullName -Update -DestinationPath \"GitRepo-Backup_$(Get-Date -UFormat \"%Y-wk%V\").zip\"; Remove-Item $_.FullName -Recurse -Force }'"
  ];
};

#!Insecure Packages 
  #nixpkgs.config.permittedInsecurePackages = [ "packageName" ];



#!Apps
  environment.systemPackages = with pkgs; [
  #Permanent
  boatswain #Control Elgato Stream Deck devices.

  #If Im testing apps make sure to add them to core-packages.nix if I want them on all systems after

  ];


#!TESTING New Options
#If Im testing new options make sure to add them to core-configs.nix if I want them on all systems after



#!Boiler Plate Stuff 
# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
system.stateVersion = "23.05"; # Did you read the comment?




}

