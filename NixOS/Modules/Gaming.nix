{ config, pkgs, lib, ... }:
{

#! Install these for flatpak support
environment.systemPackages = with pkgs; [

  protonup-ng
steam
steam-run
lutris
(lutris.override {
	      extraPkgs = pkgs: [
		# List package dependencies here
		wineWowPackages.stable
		winetricks
	      ];
	    })

];



}