#!/run/current-system/sw/bin/sh

echo "copy token:"
cat gittoken | wl-copy
unset SSH_ASKPASS
git push origin main
