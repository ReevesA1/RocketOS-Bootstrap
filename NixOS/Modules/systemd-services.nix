#? Diagnose with these next commands
#journalctl --user-unit foo.service  
#systemctl --user status foo 
#systemctl --user start foo
#* Timers
#systemctl list-timers 
#watch -n 1 systemctl list-timers --all #! watch in real time
#*Test
#OnCalendar = "*-*-* *:*:00"; #runs every minute

{ config, pkgs, lib, ... }:

{

#!####################################################
#!                    SERVICES                      ##
#!####################################################

#Place Holder

#!#################################################################################
#!                    TIMERS TO REPLACES DEPRECATED CRONS                        ##
#!#################################################################################
#!According to this https://nixos.wiki/wiki/Cron crons are depricated and these should be used https://nixos.wiki/wiki/Systemd/Timers

  

}



