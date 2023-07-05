{ config, pkgs, lib, ... }:

  {
  #!Install prootonvpn
  environment.systemPackages = with pkgs; [


  protonvpn-cli
  #protonvpn-gui #might need this to login originaly if 2fa doesnt work but then just use protonvpn-cli - command is protonvpn-cli login [ProtonVPN username]


  ];

#! Timer NO GO DBUS KEYRING ISSUES
systemd  = {
    
    #? Monitor Internet connection
    timers."protonvpn-cli_connection_monitor" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "*-*-* *:*:00"; #Testing every minute
        Unit = "protonvpn-cli_connection_monitor.service";
      };
    };
    services."protonvpn-cli_connection_monitor" = {
      script = ''
        ${pkgs.bash}/bin/bash $HOME/MEGAsync/Scripts/SystemD-Timers/Universal/protonvpn-cli_connection_monitor.sh
      '';
      serviceConfig = {
        User = "rocket";
      Environment = ''
        PATH=${pkgs.flatpak}/bin:$HOME/.local/share:/run/current-system:/var/lib:${pkgs.protonvpn-cli}/bin/:${pkgs.powershell}/bin/:${pkgs.dbus}/bin/:${pkgs.bash}/bin/:
        '';                                                                                                                                               
      };
    };
  };


}




  