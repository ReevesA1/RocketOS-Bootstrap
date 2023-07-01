#test
  #!FYI's
  # https://nixos.wiki/wiki/Nvidia


{ config, pkgs, lib, ... }:
  
  {

    services.xserver.videoDrivers = ["nvidia"]; 
    programs.xwayland.enable = true; #was only needed for wayland to work

  

  hardware = {
    nvidia.prime.sync.enable = true;
    nvidia.prime.intelBusId = "PCI:00:02:0"; # fyi need both nvidia and intel because laptop has both or else built in screen wont work
    nvidia.prime.nvidiaBusId = "PCI:01:00:0";
    nvidia.modesetting.enable = true; #needed for wayland to work
    nvidia.powerManagement.enable = true; #fix suspend/resume screen corruption in sync mode
    opengl = {
    extraPackages = [
    pkgs.mesa_drivers
    pkgs.linuxPackages.nvidia_x11.out
    pkgs.vaapiIntel
    pkgs.vaapiVdpau
    pkgs.libvdpau-va-gl
    ];
    driSupport = true;
    driSupport32Bit = true;

    };
};

}