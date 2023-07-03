#!FYI's
  # https://nixos.wiki/wiki/Nvidia

#!Chris TItus worked but pc suspends after waking 
#{ config, pkgs, lib, ... }:
#  
#  {
#
#    services.xserver.videoDrivers = ["nvidia"]; 
#    programs.xwayland.enable = true; # only needed for wayland to work
#
#  
#
#  hardware = {
#    nvidia.prime.sync.enable = true;
#    nvidia.prime.intelBusId = "PCI:00:02:0"; #! fyi need both nvidia and intel because ROG-laptop has both or else built in screen wont work
#    nvidia.prime.nvidiaBusId = "PCI:01:00:0";  #! fyi need both nvidia and intel because ROG-laptop has both or else built in screen wont work
#    nvidia.modesetting.enable = true; #needed for wayland to work
#    nvidia.powerManagement.enable = true; #fix suspend/resume screen corruption in sync mode
#    opengl = {
#    extraPackages = [
#    pkgs.mesa_drivers
#    pkgs.linuxPackages.nvidia_x11.out
#    pkgs.vaapiIntel
#    pkgs.vaapiVdpau
#    pkgs.libvdpau-va-gl
#    ];
#    driSupport = true;
#    driSupport32Bit = true;
#
#    };
#};
#
#}


#! Official Way from https://nixos.wiki/wiki/Nvidia
{ config, pkgs, lib, ... }:

{

  # Make sure opengl is enabled
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # NVIDIA drivers are unfree.
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
    ];

  # Tell Xorg to use the nvidia driver
  services.xserver.videoDrivers = ["nvidia"];
  #only needed for wayland to work
  programs.xwayland.enable = true; 

  hardware.nvidia = {
    
    prime.intelBusId = "PCI:00:02:0"; #! fyi need both nvidia and intel because ROG-laptop has both or else built in screen wont work
    prime.nvidiaBusId = "PCI:01:00:0";  #! fyi need both nvidia and intel because ROG-laptop has both or else built in screen wont work

    # Modesetting is needed for most wayland compositors
    modesetting.enable = true;

    # Use the open source version of the kernel module
    # Only available on driver 515.43.04+
    open = true;

    # Enable the nvidia settings menu
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  
    specialisation = {
    external-display.configuration = {
      system.nixos.tags = [ "external-display" ];
      hardware.nvidia = {
        prime.offload.enable = lib.mkForce false;
        powerManagement.enable = lib.mkForce false;
      };
    };
  };
}