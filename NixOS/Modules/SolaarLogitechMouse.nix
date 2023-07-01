#test
{ config, pkgs, lib, ... }:


  {
  environment.systemPackages = with pkgs; [

    solaar
  
  ];

  #! Make rule so dongle works
  #? see if it worked with this command
  #grep -il "logitech" /etc/udev/rules.d/*.rules /lib/udev/rules.d/*.rules
  services.udev.packages = with pkgs; [ logitech-udev-rules ]; #needed for solaar

  }