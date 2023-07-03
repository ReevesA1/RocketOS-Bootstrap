#! Diagnose with these next commands
#journalctl -u cron -n 20
#systemctl status cron
#journalctl -u cron -g CMD
#journalctl -u cron -g CMD --since "2023-07-01 19:00:00" --until "2023-07-02 7:00:00"
#journalctl -u cron -g CMD --since "2 hours ago"




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