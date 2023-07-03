#? Diagnose with these next commands
#journalctl --user-unit foo.service  
#systemctl --user status foo 
#systemctl --user start foo
#*add this line for thumbs up
#Write-Host ([char]0xD83D + [char]0xDC4D)
#Write-Host "NAMEOFSCRIPT Worked!  `u{1F44D}" -ForegroundColor Green
#*Check Timers
#systemctl list-timers 
#systemctl --type=timer --all --failed 
#systemctl list-unit-files
#watch -n 1 systemctl list-timers --all #! watch in real time
#*Timers Triggers
#OnCalendar = "*-*-* *:*:00"; #runs every minute (good for testing)
#OnCalendar = "*-*-* 7,19:00:00"; #7am 7pm example
#OnBootSec = 60;
#*Other timersConfig
#Persistent=true; #if missed because pc was off it will run the timer next boot
#*important environemnt line put in all
#Environment = "PATH=${pkgs.flatpak}/bin:$HOME/.local/share:/run/current-system:/var/lib";

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


  systemd = {
    
    #? Makes Sure Timers are executable
    timers."make-systemd-timer-scripts-execuable" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = 60;
        Unit = "make-systemd-timer-scripts-execuable.service";
      };
    };
    services."make-systemd-timer-scripts-execuable" = {
      script = ''
        ${pkgs.powershell}/bin/pwsh $HOME/MEGAsync/Scripts/SystemD-Timers/Universal/make-systemd-timer-scripts-execuable.ps1
      '';
      serviceConfig = {
        User = "rocket";
        Environment = "PATH=${pkgs.flatpak}/bin:$HOME/.local/share:/run/current-system:/var/lib";
      };
    };



    #? Daily Universal Update and Misc Timer
    timers."daily-universal" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "*-*-* 7,19:00:00";
        Unit = "daily-universal.service";
      };
    };
    services."daily-universal" = {
      script = ''
        ${pkgs.powershell}/bin/pwsh $HOME/MEGAsync/Scripts/SystemD-Timers/Universal/daily-universal.ps1
      '';
      serviceConfig = {
        User = "rocket";
        Environment = "PATH=${pkgs.flatpak}/bin:$HOME/.local/share:/run/current-system:/var/lib";
      };
    };
  

  };



  

}



