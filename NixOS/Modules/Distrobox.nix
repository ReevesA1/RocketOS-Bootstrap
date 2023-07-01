{ config, pkgs, lib, ... }:
  {

  environment.systemPackages = with pkgs; [

    
  #podman
  unstable.podman
  podman-desktop
  distrobox
  
  ];

  virtualisation = {
    #docker.enable = true; 
    #virtualbox.host.enable = true;
    #libvirtd.enable = true; 
    podman.enable = true;
    podman.dockerCompat = true;
  };



  }