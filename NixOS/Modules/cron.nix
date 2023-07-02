{ config, pkgs, lib, ... }:
{

services.cron = {
  #enable = true;#gets enabled in core-configs.nix
  systemCronJobs = [
    "0 7,19 * * * flatpak update && flatpak uninstall --unused"
  ];
};


}