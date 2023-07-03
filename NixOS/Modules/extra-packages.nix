{ config, pkgs, lib, ... }:
{

#!#####################################
#!         THESE ALL HAVE FLATPAKS   ##
#!######################################


environment.systemPackages = with pkgs; [
#Productivity
obsidian

#Security




];



}

#TODO remember to add all to the nixpkgs list to BUT GREYED OUT?
/*



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

if ($architecture -eq "aarch64") {

    Write-Output "aarch64 only - Going to install Universal NIX Packages that fill in lack of flatpak support on aarch64 ...press enter to continue"
    Read-Host

    #! ONLY PACKAGES I CANNOT GET WORKING ON AARCH64 with nix or flatpaks
    #Megasync
    #Microsoft edge
    #Spotify but I can use browser anyway
    #Notion but I can use browser anyway


    if ($ID -eq "nixos") {

        #?###############################################################################
        ###? PACKAGES THAT FILL IN aarch64 support missing packages                   ###
        #?###############################################################################


        #Media
        $env:NIXPKGS_ALLOW_UNFREE = 1; nix-env -iA nixos.spotify #? did not work on parallels wtf but it worked on aarch64 ubuntu?


        #Dev
        $env:NIXPKGS_ALLOW_INSECURE = 1; nix-env -iA nixos.github-desktop #? did not work on parallels wtf but it worked on aarch64 ubuntu?
        $env:NIXPKGS_ALLOW_UNFREE = 1; nix-env -iA nixos.jetbrains.rider #? did not work on parallels wtf but it worked on aarch64 ubuntu?
        nix-env -iA nixos.icon-library

    }

    #!NOTE THAT THIS IS FOR OTHER DISTROS NOT FOR NIXOS
    elseif ($ID -ne "nixos") {


        #Media
        $env:NIXPKGS_ALLOW_UNFREE = 1; nix-env -iA nixpkgs.spotify
        
        
        #Dev
        $env:NIXPKGS_ALLOW_INSECURE = 1; nix-env -iA nixpkgs.github-desktop
        $env:NIXPKGS_ALLOW_UNFREE = 1; nix-env -iA nixpkgs.jetbrains.rider
        nix-env -iA nixpkgs.icon-library


    */