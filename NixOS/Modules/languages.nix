{ config, pkgs, lib, ... }:


{

environment.systemPackages = with pkgs; [


  #python3Full #!will need a exception
	#python.pkgs.pip
  nodejs
  cargo
  dotnet-sdk_7


];



}