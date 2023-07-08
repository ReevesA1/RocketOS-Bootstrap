{ config, pkgs, lib, ... }:

{
  services.xserver.videoDrivers = [ "amdgpu" ];
}