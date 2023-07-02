{ config, pkgs, lib, ... }:
{

services.cron = {
  enable = true;
  systemCronJobs = [
    "0 7,19 * * * flatpak update && flatpak uninstall --unused"
  ];
};


}