{ config, pkgs, lib, ... }:
{
#? to view use these commands
#sudo cat /etc/crontab #*best one
#crontab -l
#sudo crontab -u rocket -l
services.cron = {
  #enable = true;#gets enabled in core-configs.nix
  systemCronJobs = [
    "0 7,19 * * * flatpak update --noninteractive --assumeyes && flatpak uninstall --unused"
    #?0 8 * * * /path/to/example.sh && curl -fsS --retry 3 https://hc-ping.com/your-unique-check-url
  ];
};


}