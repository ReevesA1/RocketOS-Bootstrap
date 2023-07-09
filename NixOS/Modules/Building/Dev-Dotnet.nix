{ config, pkgs, lib, ... }:


{

  environment.systemPackages = with pkgs; [
    dotnet-sdk_7


];


#Android Stuff
  programs.adb.enable = true;
  nixpkgs.config.android_sdk.accept_license = true;


}