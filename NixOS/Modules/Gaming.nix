{ config, pkgs, lib, ... }:
{

  environment.systemPackages = with pkgs; [
    protonup-ng
    steam
    steam-run
    heroic
    lutris
    (lutris.override {
      extraPkgs = pkgs: [
        wineWowPackages.stable
        winetricks
      ];
    })
  ];
}