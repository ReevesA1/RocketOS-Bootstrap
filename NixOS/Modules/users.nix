  { config, pkgs, ... }:
  
  {

  #! Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rocket = {
    isNormalUser = true;
    description = "rocket";
    extraGroups = [ "networkmanager" "wheel" ];
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