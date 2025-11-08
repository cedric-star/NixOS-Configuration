#!/usr/bin/bash

echo "=== NixOS System-Reinigung ==="
echo "Beginn Freier Speicher:"
df -h / | tail -1
# Alte Generationen löschen (älter als 7 Tage)
echo "Lösche alte Generationen..."
sudo nix-collect-garbage -d

# Garbage Collection im Nix Store
echo "Führe Garbage Collection aus..."
sudo nix-store --gc

# Nix Store optimieren (Deduplizierung)
echo "Optimiere Nix Store..."
sudo nix-store --optimise

# Boot-Einträge aufräumen (nur die letzten behalten)
echo "Räume Boot-Einträge auf..."
sudo nix-env --list-generations --profile /nix/var/nix/profiles/system
# Alternativ: sudo nix-env -p /nix/var/nix/profiles/system --delete-generations old

# User Profile aufräumen
echo "Räume User-Profile auf..."
nix-collect-garbage --delete-older-than 7d

# Home-Manager Generationen (falls verwendet)
if command -v home-manager &> /dev/null; then
    echo "Räume Home-Manager auf..."
    home-manager expire-generations "-7 days"
fi

# Temporäre Dateien
echo "Lösche temporäre Build-Dateien..."
sudo rm -rf /tmp/nix-*

# Nix Registry Cache (optional)
echo "Lösche Registry Cache..."
rm -rf ~/.cache/nix

echo "=== Reinigung abgeschlossen ==="
echo "Freier Speicher:"
df -h / | tail -1