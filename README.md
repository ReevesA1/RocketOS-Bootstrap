# RocketOS-Bootstrap

### Windows
```

& "$env:USERPROFILE\RocketOS-Bootstrap\Windows.ps1"

```

### Mac
```
 find $HOME/RocketOS-Bootstrap/Mac.sh -type f -print0 | xargs -0 chmod 775
$HOME/RocketOS-Bootstrap/Mac.sh
```

### Linux
```
# Check if repo exist and delete it if it does
if [ -d "RocketOS-Bootstrap" ]; then
  command rm -rf "RocketOS-Bootstrap"
fi

# Clone Repo
git clone --force https://github.com/ReevesA1/RocketOS-Bootstrap.git

# Give Proper Permisions
 find $HOME/RocketOS-Bootstrap/Linux.sh -type f -print0 | xargs -0 chmod 775
 
# Run the Script
 $HOME/RocketOS-Bootstrap/Linux.sh
```
