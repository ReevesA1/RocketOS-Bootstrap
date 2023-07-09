{ config, pkgs, lib, ... }:
{

  environment.systemPackages = with pkgs; [
    steam
    steam-run
    #heroic #?i dont use epic so dont bother installing it for now
    #bottles #!Giving me Issues but I think its cause I deleted it after it was build worth trying again if not use the flatpak
    #protontricks #?dont know how to use
    #protonup-qt #?dont know how to use
    #playonlinux #?dont know how to use
    #lutris #? Tried once did not work could not find nvidia drivers so trying to use bottles which looks easier atleast to run Diablos 4
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