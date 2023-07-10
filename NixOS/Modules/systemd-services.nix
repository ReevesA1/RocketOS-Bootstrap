#? Diagnose with these next commands
#journalctl --user-unit foo.service  
#systemctl --user status foo 
#systemctl --user start foo
#*add this line for thumbs up
#Write-Host "It Worked!  `u{1F44D}" -ForegroundColor Green
#Write-Host "Thumbs down!  `u{1F44E}"
#*Check Timers/Trouble Shooting
#systemctl list-timers  
#systemctl --type=timer --all --failed 
#systemctl list-unit-files
#watch -n 1 systemctl list-timers --all #! watch in real time
#journalctl -fu foo.service #! ( can do -f ! )another good one to see what program i should add to environment like so ->  "PATH=${pkgs.flatpak}/bin:${pkgs.git}/bin:${pkgs.curl}/bin:${pkgs.coreutils}/bin";
#*Timers Triggers
#OnCalendar = "*-*-* *:*:00"; #runs every minute (good for testing)
#OnCalendar = "*-*-* 7,19:00:00"; #7am 7pm example
#OnBootSec = 60;
#*Other Timer Jobs Configs (not for services)
#Persistent=true; #if missed because pc was off it will run the timer next boot
#*Ultimate environemnt line put in all
#Environment = "PATH=${pkgs.flatpak}/bin:${pkgs.protonvpn-cli}/bin/:${pkgs.powershell}/bin/:${pkgs.bash}/bin:${pkgs.starship}/bin:${pkgs.git}/bin:${pkgs.curl}/bin:${pkgs.coreutils}/bin";

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
        Persistent = true;
      };
    };
    services."make-systemd-timer-scripts-execuable" = {
      script = ''
        ${pkgs.powershell}/bin/pwsh $HOME/Timers/Universal/make-systemd-timer-scripts-execuable.ps1
      '';
      serviceConfig = {
        User = "rocket";
        Environment = "PATH=${pkgs.flatpak}/bin:${pkgs.protonvpn-cli}/bin/:${pkgs.powershell}/bin/:${pkgs.bash}/bin:${pkgs.starship}/bin:${pkgs.git}/bin:${pkgs.curl}/bin:${pkgs.coreutils}/bin";
      };
    };



    #? Daily Universal Update and Misc Timer
    timers."daily-universal" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "*-*-* 7,19:00:00";
        Unit = "daily-universal.service";
        Persistent = true;
      };
    };
    services."daily-universal" = {
      script = ''
        ${pkgs.powershell}/bin/pwsh $HOME/Timers/Universal/daily-universal.ps1
      '';
      serviceConfig = {
        User = "rocket";
        Environment = "PATH=${pkgs.flatpak}/bin:${pkgs.protonvpn-cli}/bin/:${pkgs.powershell}/bin/:${pkgs.bash}/bin:${pkgs.starship}/bin:${pkgs.git}/bin:${pkgs.curl}/bin:${pkgs.coreutils}/bin";
      };
    };
  

  };



  

}



