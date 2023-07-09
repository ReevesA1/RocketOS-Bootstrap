{ config, pkgs, lib, ... }:
{

  environment.systemPackages = with pkgs; [
    steam
    steam-run
    #heroic
    bottles
    protontricks
    #protonup-qt
    #playonlinux #found this have not tested it
    #lutris
    #(lutris.override {
    #  extraPkgs = pkgs: [
    #    wineWowPackages.stable
    #    winetricks
    #  ];
    #})
  ];


  # Steam
	programs.steam = {
	  enable = true;
	  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
	  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
	};

}