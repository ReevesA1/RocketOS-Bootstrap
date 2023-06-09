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
  #./cron.nix [DEPRECATED]


  #! Optional
  #Gnome
  ./gnome.nix

  #KDE
  #./kde.nix

  #Flatpak Support
  ./flatpaks.nix

  #Apps with extra configs
  ./ProtonVPN.nix
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

  #*FOR HIGHER END MACHINES WITH LOTS OF RAM DEFAULT IS 60 use "cat /proc/sys/vm/swappiness" to check
  boot.kernel.sysctl = { "vm.swappiness" = 10;};

#! Sound Fix for ROG-laptop (do a reboot)
boot.extraModprobeConfig = ''
options snd-hda-intel model=asus-zenbook
options snd_hda_intel enable=1
''; 


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


#!SystemD Services

  systemd = {
    
    #? github-repo-download-backups
    timers."github-repo-backups" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "*-*-* 8,18:00:00"; #8am and 6pm
        Unit = "github-repo-backups.service";
        Persistent = true;
      };
    };
    services."github-repo-backups" = {
      script = ''
        ${pkgs.bash}/bin/bash $HOME/Timers/ROG-Laptop/github-repo-backups.sh
      '';
      serviceConfig = {
        User = "rocket";
        Environment = "PATH=${pkgs.flatpak}/bin:${pkgs.protonvpn-cli}/bin/:${pkgs.powershell}/bin/:${pkgs.bash}/bin:${pkgs.starship}/bin:${pkgs.git}/bin:${pkgs.curl}/bin:${pkgs.coreutils}/bin:${pkgs.iputils}/bin";
                      
      };
    };
  
    #? zip-github-repo-backups-weekly
    timers."zip-github-repo-backups-weekly" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "Sun *-*-* 21:00:00";
        Unit = "zip-github-repo-backups-weekly.service";
        Persistent = true;
      };
    };
    services."zip-github-repo-backups-weekly" = {
      script = ''
        ${pkgs.bash}/bin/bash -c 'source ./etc/profile; $HOME/Timers/ROG-Laptop/zip-github-repo-backups-weekly.sh'
      '';
      serviceConfig = {
        User = "rocket";
        Environment = "PATH=${pkgs.flatpak}/bin:${pkgs.protonvpn-cli}/bin/:${pkgs.powershell}/bin/:${pkgs.bash}/bin:${pkgs.starship}/bin:${pkgs.git}/bin:${pkgs.curl}/bin:${pkgs.coreutils}/bin";
      };
    };
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
services.gnome.gnome-remote-desktop.enable  = true;


#!Boiler Plate Stuff 
# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
system.stateVersion = "23.05"; # Did you read the comment?




}

