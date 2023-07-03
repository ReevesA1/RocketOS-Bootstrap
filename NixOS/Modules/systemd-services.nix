#? Diagnose with these next commands
#journalctl --user-unit foo.service  
#systemctl --user status foo 
#systemctl --user start foo
#systemctl list-timers 

{ config, pkgs, lib, ... }:



{
#!#################################################################################
#!                    TIMERS TO REPLACES DEPRECATED CRONS                        ##
#!#################################################################################
#!According to this https://nixos.wiki/wiki/Cron crons are depricated and these should be used https://nixos.wiki/wiki/Systemd/Timers







}



/*
#!###############################################################
#!                    OTHER  EXAMPLES                          ##
#!###############################################################
#? I don't use these anymore because I was able to make .desktop files in $HOME/.config/autostart

  systemd = {

  #! Chris Titus Pole Kit
  user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
  };
    extraConfig = ''
      DefaultTimeoutStopSec=10s
    '';


#! Ulauncher start at boot (works - example of starting a nix package)
  user.services.ulauncher = {
    enable = true;
    description = "Start Ulauncher";
    script = "${pkgs.ulauncher}/bin/ulauncher --hide-window";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
  };

#! ProtonVPN at boot (Works - example of starting a command or a script)


user.services.protonvpn-cli = {
  description = "Start protonvpn-cli";
  wantedBy = [ "multi-user.target" "sleep.target" "graphical-session.target" ];
  after = [ "suspend.target" "graphical-session.target" ];
  serviceConfig = {
    ExecStartPre = "${pkgs.coreutils}/bin/sleep 10";
    ExecStart = "${pkgs.bash}/bin/bash -c 'while true; do if ${pkgs.protonvpn-cli}/bin/protonvpn-cli status | ${pkgs.gnugrep}/bin/grep -q \"No active Proton VPN connection.\"; then ${pkgs.protonvpn-cli}/bin/protonvpn-cli killswitch --off && ${pkgs.protonvpn-cli}/bin/protonvpn-cli killswitch --on && ${pkgs.protonvpn-cli}/bin/protonvpn-cli connect --cc CA; fi; sleep 30; done'";
    Restart = "always";
  };
};

#! Synergy start at boot (Works - example of starting a flatpak)

user.services.synergy = {
  description = "Start Synergy";
  wantedBy = [ "graphical-session.target" ];
  after = [ "graphical-session.target" ];
  serviceConfig = {
    ExecStart = "/run/current-system/sw/bin/flatpak run com.symless.synergy";
    #Restart = "always";
    Environment = "PATH=${pkgs.flatpak}/bin";
  };
};
}


