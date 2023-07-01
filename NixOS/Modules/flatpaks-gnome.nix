{ config, pkgs, lib, ... }:
{

#! Install these for flatpak support
environment.systemPackages = with pkgs; [
flatpak
xdg-desktop-portal-gtk
];

#!Enable flatpaks
services.flatpak.enable = true;

#! FlatPaks Dependencies
services.dbus.enable = true; # needed for flatpaks to talk to each other
xdg.portal = {
  enable = true; # This for sure needs to be on
  #wlr.enable = true; # Not sure what this setting is for
  #extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; #Only needed if not using Gnome
};

}