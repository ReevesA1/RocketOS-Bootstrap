{ config, pkgs, lib, ... }:

{
  
  #!system wide packages
  environment.systemPackages = with pkgs; [


  protonvpn-cli
  #protonvpn-gui #might need this to login originaly if 2fa doesnt work but then just use protonvpn-cli - command is protonvpn-cli login [ProtonVPN username]




  systemd = {
    
    #? Monitor Internet connection
    timers."protonvpn-cli_connection_monitor" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = 60;
        Unit = "protonvpn-cli_connection_monitor.service";
      };
    };
    services."protonvpn-cli_connection_monitor" = {
      script = ''
        ${pkgs.powershell}/bin/pwsh $HOME/MEGAsync/Scripts/SystemD-Timers/Universal/protonvpn-cli_connection_monitor.ps1
      '';
      serviceConfig = {
        User = "rocket";
        Environment = "PATH=${pkgs.flatpak}/bin:$HOME/.local/share:/run/current-system:/var/lib";
      };
    };

  };
}

