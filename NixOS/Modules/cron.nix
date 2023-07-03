/*
#!According to this https://nixos.wiki/wiki/Cron crons are depricated and these should be used https://nixos.wiki/wiki/Systemd/Timers

#?Diagnose with these next commands
#journalctl -u cron -n 20
#systemctl status cron
#journalctl -f -u cron
#journalctl -u cron -g CMD
#journalctl -u cron -g CMD -f #!-f is to follow
#journalctl -u cron -g CMD --since "2023-07-01 19:00:00" --until "2023-07-02 7:00:00"
#journalctl -u cron -g CMD --since "2 hours ago"
#? to view use these commands
#sudo cat /etc/crontab #*best one
#crontab -l
#sudo crontab -u rocket -l
#? ALSO REMEMBER if I OMIT ROCKET IT WILL BE SYSTEM WIDE
#? and this is one of the ways the wiki showerd how to source etc folder  "* * * * * rocket ./etc/profile; $HOME/MEGAsync/Scripts/Crons/zip-github-repo-backups-weekly.sh"


#!##############################
#!     OLD System Wide Crons   ##
#!##############################

{ config, pkgs, lib, ... }:
{
services.cron = {
  #enable = true;#gets enabled in core-configs.nix
  systemCronJobs = [
    "0 7,19 * * * flatpak update --noninteractive --assumeyes && flatpak uninstall --unused"
    #?0 8 * * * /path/to/example.sh && curl -fsS --retry 3 https://hc-ping.com/your-unique-check-url
  ];
};


}



#!##############################
#!     OLD ROG-Laptop Crons   ##
#!##############################


services.cron = {
  #enable = true;#gets enabled in core-configs.nix
  systemCronJobs = [
    "0 8 * * * rocket $HOME/MEGAsync/Scripts/Crons/github-repo-backups.sh"
    "0 18 * * * rocket $HOME/MEGAsync/Scripts/Crons/github-repo-backups.sh"
    "* * * * * rocket ./etc/profile; $HOME/MEGAsync/Scripts/Crons/zip-github-repo-backups-weekly.sh"

  ];
};



#!###########################
#!     OLD SER-3   Crons   ## DID NOT WORK I THINK I NEED TO do like  "* * * * * rocket ./etc/profile; $HOME/MEGAsync/Scripts/Crons/zip-github-repo-backups-weekly.sh" and source the etc folder with rocket
#!###########################

services.cron = {
  #enable = true;#gets enabled in core-configs.nix
  systemCronJobs = [
  #for some reason I always have lots of conkys in kde so if there is more then one process every 5 minutes it terminats all and restarts 1 #todo IT WORKS  move it to kde?
  "* * * * * bash -c \"pgrep -c conky | if [[ $(pgrep -c conky) -gt 1 ]]; then pkill conky; sleep 1; nohup conky & fi\""

  ];
};