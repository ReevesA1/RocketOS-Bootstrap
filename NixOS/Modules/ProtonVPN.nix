{ config, pkgs, lib, ... }:
    {
  
  #!system wide packages
  environment.systemPackages = with pkgs; [


  protonvpn-cli
  #protonvpn-gui #might need this to login originaly if 2fa doesnt work but then just use protonvpn-cli - command is protonvpn-cli login [ProtonVPN username]




  systemd = {
    
    #? Monitor Internet connection
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








}

