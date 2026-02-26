#!/run/current-system/sw/bin/sh

# Garbage Collection im Nix Store
echo "Führe Garbage Collection aus..."
sudo nix-store --gc

# User-Profile/Boot-Einträge aufräumen
echo "Räume User-Profile auf..."
nix-collect-garbage --delete-older-than 3d

# Temporäre Dateien
echo "Lösche temporäre Build-Dateien..."
sudo rm -rf /tmp/nix-*

# Nix Registry Cache (optional)
echo "Lösche Registry Cache..."
rm -rf ~/.cache/nix

# Nix Store optimieren 
echo "Optimiere Nix Store..."
sudo nix-store --optimise