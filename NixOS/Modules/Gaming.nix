{ config, pkgs, lib, ... }:
{

  environment.systemPackages = with pkgs; [
    steam
    steam-run
    #heroic #i dont use epic so dont bother installing it for now
    #bottles #!Giving me Issues but I think its cause I deleted it after it was build worth trying again if not use the flatpak
    #protontricks
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