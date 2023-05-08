# ---------Installs Xcode Command Line Tools--------
# Check if Xcode is already installed
if xcode-select -p 1>/dev/null; then
  echo "\033[32mXcode Command Line Tools is already installed... Press Enter to continue\033[0m"
  read
else
  # Print a message in green color
  echo "\033[32mInstalling Xcode Command Line Tools... Press Enter to continue\033[0m"
  read

  # Check if the Xcode Command Line tool file exists on the Stubby USB volume
  if [ -f "/Volumes/Stubby/Xcode_Command_Line_Tools.dmg" ]; then

    echo "\033[32mInstalling from usb drive... Press Enter to continue\033[0m"
    read

    # Mount the disk image
    hdiutil attach /Volumes/Stubby/Xcode_Command_Line_Tools.dmg

    # Install the package
    sudo installer -pkg /Volumes/Command\ Line\ Developer\ Tools/Command\ Line\ Tools.pkg -target / -verboseR

    # Unmount the disk image
    hdiutil detach /Volumes/Command\ Line\ Developer\ Tools

  else
    echo "\033[32mWarnin 30min Downloading and Installing from internet... Press Enter to continue\033[0m"
    read
    xcode-select --install
  fi
fi

# ---------Clone repo and launch Bootstrap-Mac.sh --------
echo "\033[32mCheck if repo exist and delete it before cloning it... Press Enter to continue \033[0m"
read
if [ -d "$HOME/Downloads/RocketOS-Bootstrap" ]; then
  command rm -vrf "$HOME/Downloads/RocketOS-Bootstrap"
fi

# Clone Repo
git clone https://github.com/ReevesA1/RocketOS-Bootstrap.git $HOME/Downloads/RocketOS-Bootstrap

# Give Proper Permisions To Entire Folder
find "$HOME/Downloads/RocketOS-Bootstrap/" -print0 | xargs -0 chmod 775

echo "\033[32mRun Bootstrap-Mac.sh... Press Enter to Continue  \033[0m"
read
$HOME/Downloads/RocketOS-Bootstrap/Bootstrap-Mac.sh
