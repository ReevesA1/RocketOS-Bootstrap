{ config, pkgs, lib, ... }:


{

  environment.systemPackages = with pkgs; [
  yuzu-mainline
  ];

}
