
#! --------Package Managers Part 2------------

############
# Homebrew #
############

# Install dependencies using brew bundle
arch -arm64 brew bundle

# Turn off Homebrew analytics
brew analytics off

# Add Homebrew taps
brew tap buo/cask-upgrade
brew tap homebrew/cask-versions
brew tap homebrew/bundle
brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew tap homebrew/core



#! ----------Install Powershell with modules---------

brew install --cask powershell         # (Installs here /usr/local/microsoft/powershell/7/pwsh)
brew install --cask powershell-preview # from cask-versions Tap (installs here /usr/local/microsoft/powershell/7-preview/pwsh)


#! ----------Apps (Only to get RocketOS Going Properly)---------
#! I will use Homebrew for this, I tried using nix but it gets complicated. Just use nix for one of apps not for the base setup

echo "\033[32mInstall Apps to get RocketOS Going... Press Enter to continue  \033[0m"
read

brew install --cask font-jetbrains-mono #from cask-fonts Tap
brew install --cask alacritty
brew install mas
brew install gum
brew install starship

#! --------Misc------------

#Make powershell my default shell
echo "\033[32mMake powershell my default shell...Press Enter to continue \033[0m"
read

sudo chsh -s /usr/local/bin/pwsh-preview $env:USER

#! --------TESING------------
#TODO Testing put these in base-mac-env.ps1
echo "\033[32mTesting Default Writes... Press Enter to continue \033[0m"
read

# Turn natural scrolling off
defaults write -g com.apple.swipescrolldirection -bool FALSE

# Dock
defaults write com.apple.dock minimize-to-application -bool TRUE
defaults write com.apple.dock largesize -int 128 # Magnification = LARGE
killall Dock                                     # resets dock

echo "\033[32mmight have to logout and back in for default writes to work \033[0m"

#? ---------THEN END---------------
echo "\033[32mYou should now be able to launch RocketOS from the repo readme command... Press Enter to continue \033[0m"
read
