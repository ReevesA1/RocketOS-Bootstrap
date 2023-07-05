{ config, pkgs, lib, ... }:

{
  #!Install protonvpn
  environment.systemPackages = with pkgs; [


  protonvpn-cli
  #protonvpn-gui #might need this to login originaly if 2fa doesnt work but then just use protonvpn-cli - command is protonvpn-cli login [ProtonVPN username]


  ];

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
    # services."protonvpn-cli_connection_monitor" = {
    #   script = ''
    #     ${pkgs.powershell}/bin/pwsh $HOME/MEGAsync/Scripts/SystemD-Timers/Universal/protonvpn-cli_connection_monitor.ps1
    #   '';
    #   serviceConfig = {
    #     User = "rocket";
    #     Environment = "PATH=${pkgs.flatpak}/bin:${pkgs.protonvpn-cli}/bin/:${pkgs.powershell}/bin/:${pkgs.bash}/bin:${pkgs.starship}/bin:${pkgs.git}/bin:${pkgs.curl}/bin:${pkgs.coreutils}/bin";
    #   };
    # };

    #!Bash Version 
        services."protonvpn-cli_connection_monitor" = {
  script = ''
    export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"; eval $(/usr/bin/dbus-launch --sh-syntax) ;  if [[ $(protonvpn-cli status) =~ \bCanada\b ]]; then echo -e "Ping succeeded. You have an internet connection! \U1F44D"; else protonvpn-cli connect --cc CA && protonvpn-cli ks --permanent && echo -e "ProtonVPN-cli_connection_monitor.ps1 reconnection job ran! \nRECONNECTED TO VPN!!! \U1F44D"; fi
  '';
      serviceConfig = {
        User = "root";
        Environment = "PATH=${pkgs.flatpak}/bin:${pkgs.protonvpn-cli}/bin/:${pkgs.powershell}/bin/:${pkgs.bash}/bin:${pkgs.starship}/bin:${pkgs.git}/bin:${pkgs.curl}/bin:${pkgs.coreutils}/bin";
      };
    };
  };
}



  