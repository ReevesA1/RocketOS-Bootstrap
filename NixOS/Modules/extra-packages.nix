{ config, pkgs, lib, ... }:
{

#!#####################################
#!         THESE ALL HAVE FLATPAKS   ##
#!######################################


environment.systemPackages = with pkgs; [
#Productivity
#Notion Used Edge FLATPAK shortcut App #(only other version was snap but I can't ctrl+f to find stuff and snaps dont work on nixos)
todoist-electron
obsidian




];



}

#TODO remember to add all to the nixpkgs list to BUT GREYED OUT?
/*
    #Productivity
    #Notion Used Edge App #(only other version was snap but I can't ctrl+f to find stuff)
    flatpak install --user --assumeyes flathub com.todoist.Todoist 
    flatpak install --user --assumeyes flathub md.obsidian.Obsidian

    #Media
    #flatpak install --user --assumeyes flathub org.videolan.VLC #declared in nix

    #Security
    flatpak install --user --assumeyes flathub com.github.tchx84.Flatseal


    #Utilities
    flatpak install --user --assumeyes flathub com.raggesilver.BlackBox 
    #flatpak install --user --assumeyes flathub com.github.debauchee.barrier # I use synergy now
    flatpak install --user --assumeyes flathub me.iepure.devtoolbox
    flatpak install --user --assumeyes flathub org.nickvision.tubeconverter 
    flatpak install --user --assumeyes flathub com.github.devalien.workspaces
    flatpak install --user --assumeyes flathub com.vixalien.sticky
    flatpak install --user --assumeyes flathub org.gabmus.whatip
    flatpak install --user --assumeyes flathub org.qbittorrent.qBittorrent
    #flatpak install --user --assumeyes flathub in.bharatkalluri.splash #/home/rocket/.var/app/in.bharatkalluri.splash/cache/in.bharatkalluri.splash #I use variety now





    #Dev
    #flatpak install --user --assumeyes flathub com.visualstudio.code #might need to use the nixos version so my custom one works
    flatpak install --user --assumeyes flathub org.godotengine.Godot
    flatpak install --user --assumeyes flathub nl.hjdskes.gcolor3
    flatpak install --user --assumeyes flathub org.gnome.design.IconLibrary
    flatpak install --user --assumeyes flathub io.gitlab.gregorni.Calligraphy

}


#!##################################################################################################

if ($architecture -eq "x86_64") {

    Write-Output "X86 only - Going to install Universal Flatpaks ...press enter to continue"
    Read-Host

    ############################################################
    ###              FLATPAKS                                ###
    ############################################################
    #Browsers
    flatpak install --user --assumeyes flathub com.microsoft.EdgeDev #(Not aarch64)
    flatpak install --user --assumeyes flathub net.mullvad.MullvadBrowser #(Not aarch64)


    #Media
    flatpak install --user --assumeyes flathub com.spotify.Client #(Not aarch64 but nix packages has it covered for aarch64 systems)
    
    #Security
    flatpak install --user --assumeyes flathub pm.mirko.Atoms #(Not aarch64)

    #Dev
    flatpak install --user --assumeyes flathub io.gitlab.gregorni.ASCIIImages #letter press #(Not aarch64)
    flatpak install --user --assumeyes flathub com.jetbrains.Rider  #(Not aarch64 but nix packages has it covered for aarch64 systems)
    flatpak install --user --assumeyes flathub com.icons8.Lunacy #(Not aarch64)
    flatpak install --user --assumeyes flathub io.github.shiftey.Desktop #(Not aarch64 but nix packages has it covered for aarch64 systems)⠀

    */