{ config, pkgs, lib, ... }:
{

  environment.systemPackages = with pkgs; [
    protonup-ng
    steam
    steam-run
    lutris
    (lutris.override {
      extraPkgs = pkgs: [
        wineWowPackages.stable
        winetricks
      ];
    })
  ];
}