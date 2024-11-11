#/bin/sh

echo $USER

mkdir ~/.config/hypr/$USER
cp -n -r ~/.config/hypr/default/* ~/.config/hypr/$USER/
echo source=$USER/mod.conf > ~/.config/hypr/login.conf
