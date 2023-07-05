{ config, pkgs, lib, ... }:

{
  #!Install protonvpn
  environment.systemPackages = with pkgs; [


  protonvpn-cli
  #protonvpn-gui #might need this to login originaly if 2fa doesnt work but then just use protonvpn-cli - command is protonvpn-cli login [ProtonVPN username]


  ];



#!Connect at boot
services.protonvpn-boot = {
  script = ''
    ${pkgs.protonvpn-cli}/bin/protonvpn-cli connect -f
  '';
  serviceConfig = {
    Type = "simple";
    ExecStop = "${pkgs.protonvpn-cli}/bin/protonvpn-cli disconnect";
    ExecReload = "${pkgs.protonvpn-cli}/bin/protonvpn-cli reconnect";
    RemainAfterExit = "yes";
    Restart = "on-failure";
    RestartSec = 5;
    StartLimitIntervalSec = 500;
    StartLimitBurst = 5;
  };
};

#!Reconnect after suspend
services.protonvpn-resume = {
  script = ''
    ${pkgs.protonvpn-cli}/bin/protonvpn-cli reconnect
  '';
  serviceConfig = {
    Type = "oneshot";
  };
};

}


/*
#! RECONNECT Timer ONLY WORKS ON GNOME
#! DOES NOT WORK ON KDE - I could not figure out how to export this dynamicaly "dbus-launch --auto-syntax"
systemd  = {
    
    #? Monitor Internet connection
    timers."protonvpn-cli_connection_monitor" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "*-*-* *:*:00"; #set to everyminute is it to much?
        Unit = "protonvpn-cli_connection_monitor.service";
      };
    };

    #!Powershell Version Works only for Gnome
    services."protonvpn-cli_connection_monitor" = {
      script = ''
        ${pkgs.powershell}/bin/pwsh $HOME/MEGAsync/Scripts/SystemD-Timers/Universal/protonvpn-cli_connection_monitor.ps1
      '';
      serviceConfig = {
        User = "rocket";
        Environment = "PATH=${pkgs.flatpak}/bin:${pkgs.protonvpn-cli}/bin/:${pkgs.powershell}/bin/:${pkgs.bash}/bin:${pkgs.starship}/bin:${pkgs.git}/bin:${pkgs.curl}/bin:${pkgs.coreutils}/bin";
      };
    };
  };
}



  