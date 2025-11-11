#!/bin/bash

echo "copy token:"
cat gittoken
read
clear
cd ../
unset SSH_ASKPASS
git push origin main



