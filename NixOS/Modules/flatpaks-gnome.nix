{ config, pkgs, lib, ... }:
{


#! Install these for flatpak support
environment.systemPackages = with pkgs; [
flatpak
];


#!Enable flatpaks
services.flatpak.enable = true;


}