#!/run/current-system/sw/bin/sh


commit_message="$1"

if [ -z "$commit_message" ]; then
    commit_message="Auto-commit"
fi

cd ../


git add . &&
git commit -m "$commit_message" &&
sudo cp -r ./* /etc/nixos/ &&

cd /etc/nixos
sudo git add . &&
sudo git commit -m "$commit_message" &&

sudo nixos-rebuild switch