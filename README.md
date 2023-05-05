# RocketOS-Bootstrap

### Windows
```
# Check if repo exists and delete it if it does
if (Test-Path "RocketOS-Bootstrap") {
    Remove-Item -Recurse -Force "RocketOS-Bootstrap"
}

# Clone Repo
git clone https://github.com/ReevesA1/RocketOS-Bootstrap.git

# Run the Script
& "$env:USERPROFILE\RocketOS-Bootstrap\Windows.ps1"

```

### Mac
```
# Check if repo exist and delete it if it does
if [ -d "RocketOS-Bootstrap" ]; then
  command rm -rf "RocketOS-Bootstrap"
fi

# Clone Repo
git clone https://github.com/ReevesA1/RocketOS-Bootstrap.git

# Give Proper Permisions
 find $HOME/RocketOS-Bootstrap/Mac.sh -type f -print0 | xargs -0 chmod 775
 
# Run the Script
 $HOME/RocketOS-Bootstrap/Mac.sh
```


### Linux
```
# Check if repo exist and delete it if it does
if [ -d "RocketOS-Bootstrap" ]; then
  command rm -rf "RocketOS-Bootstrap"
fi

# Clone Repo
git clone https://github.com/ReevesA1/RocketOS-Bootstrap.git

# Give Proper Permisions
 find $HOME/RocketOS-Bootstrap/Linux.sh -type f -print0 | xargs -0 chmod 775
 
# Run the Script
 $HOME/RocketOS-Bootstrap/Linux.sh
```
