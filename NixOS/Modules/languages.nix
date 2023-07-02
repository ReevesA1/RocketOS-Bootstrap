{ config, pkgs, lib, ... }:


{

#! Install these for flatpak support
environment.systemPackages = with pkgs; [


  #python3Full #!will need a exception
	#python.pkgs.pip
  nodejs
  cargo


];



}