#!/usr/bin/env zsh
#Using this shbang for echo and read with color to work

#################################
#########  Fonts   ##############
#################################

#?ON MAC - JetBrains Mono must be from nerd font for everything to work so the brew command below is a no go and I must do it manualy
#brew install --cask font-jetbrains-mono #from cask-fonts Tap

#? Unfortunately, there isn’t a “latest” tag or URL that you can use to automatically download the most recent version of the JetBrains Mono Nerd Font. You will need to manually check the Nerd Fonts GitHub repository for new releases and update the download URL in the script accordingly.
# Set the download URL
Jetbrainurl="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/JetBrainsMono.zip"

if [ ! -f JetBrainsMono.zip ]; then

  #Download
  curl -L -O $Jetbrainurl

  # Unzip the downloaded file into the fonts directory
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # On macOS
    unzip -j JetBrainsMono.zip -d ~/Library/Fonts/
  else
    # On Linux
    if [ ! -d ~/.local/share/fonts/ ]; then
      mkdir -p ~/.local/share/fonts/
    fi
    unzip -j JetBrainsMono.zip -d ~/.local/share/fonts/
  fi

else
  echo "JetbrainsMono.zip exists ...skipping"
fi

#! I don't think I need to seperate mac and linux
# Download the font
#if [[ "$OSTYPE" == "darwin"* ]]; then
#  # On macOS
#  curl -L -O $Jetbrainurl
#else
#  # On Linux
#  if [ ! -f JetBrainsMono.zip ]; then #I could do the same for mac
#    curl -L -O $Jetbrainurl
#  else
#    echo "JetbrainsMono.zip exists"
#  fi
#fi
