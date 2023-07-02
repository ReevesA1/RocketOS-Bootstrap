{ config, pkgs, lib, ... }:
  
  {

  #! Enable sudo
    security.sudo = {
        enable = true;
        wheelNeedsPassword = true;
    };


  #! Define a user account.
  users.mutableUsers = true;
  users.users.rocket = {
    isNormalUser = true;
    description = "rocket is my main user";
    #password = "myPassword"; # Don't forget to set a password with ‘passwd’or it will get created when I bot nixos during reformat
    #hashedPassword = "hashed-password-here"; #still not recomended
    uid = 1000;
    group = "users";
    extraGroups = [
      "wheel" #allows user to use sudo
      "video"
      "audio"
      "vboxusers" #virtualbox
      "adbusers" #android ADB
      "libvirtd" #virtualzation api
      "kvm"
      "adbusers"
      "docker"
      "bluetooth"
      "lp" # for bluetooth
      "networkmanager"
      "input"
      "disk"
    ];
    createHome = true;
    home = "/home/rocket";
    packages = with pkgs; [
      #This is where I would put user only apps not system wide
    ];
  };

  #! Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "rocket";

  #? Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  }


