{ config, pkgs, lib, ... }:
    {

  #!system wide packages
  environment.systemPackages = with pkgs; [




  #############################
  ### Univeral Base Apps    ###
  #############################

  veracrypt #(Not aarch64)
  megasync #(Not aarch64)
  
  #Browsers
  mullvad-browser
  

  #Media
  spotify

  ];

  }