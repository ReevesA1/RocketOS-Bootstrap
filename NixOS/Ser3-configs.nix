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
  #./gnome.nix
  #./flatpaks-gnome.nix

  #KDE
  ./kde.nix
  ./flatpaks.nix

  #Apps with extra configs
  #./extra-packages.nix
  #./Gaming.nix
  #./languages.nix
  ./Distrobox.nix
  #./Nvidia.nix
  #./Openssh.nix
  ./SolaarLogitechMouse.nix

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
networking.hostName = "Ser3-NixOS"; 

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
#? Diagnose with these next commands
#journalctl --user-unit foo.service  
#systemctl --user status foo 
#systemctl --user start foo

#Place Holder

#!Crons
#?Diagnose with these next commands
#journalctl -u cron -n 20
#systemctl status cron
#journalctl -u cron -g CMD
#journalctl -u cron -g CMD -f #!-f is to follow
#journalctl -u cron -g CMD --since "2023-07-01 19:00:00" --until "2023-07-02 7:00:00"
#journalctl -u cron -g CMD --since "2 hours ago"
#? to view use these commands
#sudo cat /etc/crontab #*best one
#crontab -l
#sudo crontab -u rocket -l
services.cron = {
  #enable = true;#gets enabled in core-configs.nix
  systemCronJobs = [
  #for some reason I always have lots of conkys in kde so if there is more then one process every 5 minutes it terminats all and restarts 1 #todo IT WORKS  move it to kde?
  "* * * * * bash -c \"pgrep -c conky | if [[ $(pgrep -c conky) -gt 1 ]]; then pkill conky; sleep 1; nohup conky & fi\""

  ];
};



#!Insecure Packages 
  #nixpkgs.config.permittedInsecurePackages = [ "packageName" ];



#!Apps
  environment.systemPackages = with pkgs; [
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

