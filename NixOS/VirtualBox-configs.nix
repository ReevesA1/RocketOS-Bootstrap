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
  #! Optional

  #Gnome
  ./gnome.nix
  ./flatpaks-gnome.nix

  #KDE
  #./kde.nix
  #./flatpaks.nix

  #Apps with extra configs
  ./Distrobox.nix
  #./Nvidia.nix
  #./Openssh.nix
  #./SolaarLogitechMouse.nix

  ];

#?#########################################
#?##      MACHINE Exclusive OPTIONS     ###
#?#########################################

#!Bootloader
  #Systemd
  #boot.loader.systemd-boot.enable = true; #this is the preferred way instead of grub and for sure needed for Parallels
  #boot.loader.efi.canTouchEfiVariables = true; # this is usefule if I ever dual boot
  #Grub
  boot.loader.grub.enable = true; #Needed if in a vm with virtualbox
  boot.loader.grub.device = "/dev/sda";  #Needed if in a vm with virtualbox
  boot.loader.grub.useOSProber = true;  #Needed if in a vm with virtualbox

#!VirtualBox - Enable Guest edition (needed for copy paste - also must be x11 not wayland)
virtualisation.virtualbox.guest.enable = true;
virtualisation.virtualbox.guest.x11 = true;


#! Networking 
networking.hostName = "VirtualBox-NixOS"; 

#! Wayland Support
#Gnome Wayland
services.xserver.displayManager.gdm.wayland = false;  # wayland is better for parallels but not virtualbox also wayland no good for barrier or synergy yet!!!
#KDE Wayland
#services.xserver.displayManager.defaultSession = "plasmawayland"; # wayland is better for parallels but not virtualbox also wayland no good for barrier or synergy yet!!!

#!Waking from Suspend Commands 
#Use the command below to see if it works
#sudo journalctl -b | grep resumeCommands
powerManagement.resumeCommands = ''
  echo "Running resumeCommands test before" 
  
  echo "Running resumeCommands test after" 
'';


#!Insecure Packages 
  #nixpkgs.config.permittedInsecurePackages = [ "packageName" ];



#!Apps
  environment.systemPackages = with pkgs; [
  #If Im testing apps make sure to add them to core-packages.nix if I want them on all systems after


  ];


#!TESTING New Options
#If Im testing new options make sure to add them to core-configs.nix if I want them on all systems after
{
    programs.firefox = {
      enable = true;
      profiles = {
        default = {
          isDefault = true;
          extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            bitwarden
            refined-github
            sponsorblock
            ublock-origin
            decentraleyes
            clearurls
            kristofferhagen-nord-theme
            old-reddit-redirect
            betterttv
            consent-o-matic
          ];
          settings = {
            # Do not save passwords to Firefox...
            "security.ask_for_password" = 0;

            # We handle this elsewhere
            "browser.shell.checkDefaultBrowser" = false;

            # Don't allow websites to prevent use of right-click, or otherwise
            # messing with the context menu.
            "dom.event.contextmenu.enabled" = true;

            # Don't allow websites to prevent copy and paste. Disable
            # notifications of copy, paste, or cut functions. Stop webpage
            # knowing which part of the page had been selected.
            "dom.event.clipboardevents.enabled" = true;

            # Do not track from battery status.
            "dom.battery.enabled" = false;

            # Show punycode. Help protect from character 'spoofing'.
            "network.IDN_show_punycode" = true;

            # Disable site reading installed plugins.
            "plugins.enumerable_names" = "";

            # Use Mozilla instead of Google here.
            "geo.provider.network.url" =
              "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";

            # No speculative content when searching.
            "browser.urlbar.speculativeConnect.enabled" = false;

            # Sends data to servers when leaving pages.
            "beacon.enabled" = false;

            # Informs servers about links that get clicked on by the user.
            "browser.send_pings" = false;

            "browser.tabs.closeWindowWithLastTab" = false;
            "browser.urlbar.placeholderName" = "DuckDuckGo";
            "browser.search.defaultenginename" = "DuckDuckGo";

            # Safe browsing
            "browser.safebrowsing.enabled" = false;
            "browser.safebrowsing.phishing.enabled" = false;
            "browser.safebrowsing.malware.enabled" = false;
            "browser.safebrowsing.downloads.enabled" = false;
            "browser.safebrowsing.provider.google4.updateURL" = "";
            "browser.safebrowsing.provider.google4.reportURL" = "";
            "browser.safebrowsing.provider.google4.reportPhishMistakeURL" = "";
            "browser.safebrowsing.provider.google4.reportMalwareMistakeURL" =
              "";
            "browser.safebrowsing.provider.google4.lists" = "";
            "browser.safebrowsing.provider.google4.gethashURL" = "";
            "browser.safebrowsing.provider.google4.dataSharingURL" = "";
            "browser.safebrowsing.provider.google4.dataSharing.enabled" = false;
            "browser.safebrowsing.provider.google4.advisoryURL" = "";
            "browser.safebrowsing.provider.google4.advisoryName" = "";
            "browser.safebrowsing.provider.google.updateURL" = "";
            "browser.safebrowsing.provider.google.reportURL" = "";
            "browser.safebrowsing.provider.google.reportPhishMistakeURL" = "";
            "browser.safebrowsing.provider.google.reportMalwareMistakeURL" = "";
            "browser.safebrowsing.provider.google.pver" = "";
            "browser.safebrowsing.provider.google.lists" = "";
            "browser.safebrowsing.provider.google.gethashURL" = "";
            "browser.safebrowsing.provider.google.advisoryURL" = "";
            "browser.safebrowsing.downloads.remote.url" = "";

            # Don't call home on new tabs
            "browser.selfsupport.url" = "";
            "browser.aboutHomeSnippets.updateUrL" = "";
            "browser.startup.homepage_override.mstone" = "ignore";
            "browser.startup.homepage_override.buildID" = "";
            "startup.homepage_welcome_url" = "";
            "startup.homepage_welcome_url.additional" = "";
            "startup.homepage_override_url" = "";

            # Firefox experiments...
            "experiments.activeExperiment" = false;
            "experiments.enabled" = false;
            "experiments.supported" = false;
            "extensions.pocket.enabled" = false;
            "identity.fxaccounts.enabled" = false;

            # Privacy
            "privacy.donottrackheader.enabled" = true;
            "privacy.donottrackheader.value" = 1;
            "privacy.trackingprotection.enabled" = true;
            "privacy.trackingprotection.socialtracking.enabled" = true;
            "privacy.firstparty.isolate" = true;
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.archive.enabled" = false;
            "browser.toolbars.bookmarks.visibility" = "never";

            # Cookies
            "network.cookie.cookieBehavior" = 1;

            # Perf
            "gfx.webrender.all" = true;
            "media.ffmpeg.vaapi.enabled" = true;
            "media.ffvpx.enabled" = false;
            "media.rdd-vpx.enabled" = false;
            "gfx.webrender.compositor.force-enabled" = true;
            "media.navigator.mediadatadecoder_vpx_enabled" = true;
            "webgl.force-enabled" = true;
            "layers.acceleration.force-enabled" = true;
            "layers.offmainthreadcomposition.enabled" = true;
            "layers.offmainthreadcomposition.async-animations" = true;
            "layers.async-video.enabled" = true;
            "html5.offmainthread" = true;
          };
        };
      };
    };
  };



#!Boiler Plate Stuff 
# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
system.stateVersion = "23.05"; # Did you read the comment?

}


