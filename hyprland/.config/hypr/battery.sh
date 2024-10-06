#bin/sh

while true; do
  state="$(cat /sys/class/power_supply/BAT*/status)"

  if [ $state == "Discharging" ]; then
    echo "Battery saver"
    # powerprofilesctl set power-saver
    hyprctl --batch "keyword decoration:blur:enabled 0; keyword decoration:drop_shadow no"
  else 
    echo "Performance"
    # powerprofilesctl set performance
    hyprctl --batch "keyword decoration:blur:enabled 1; keyword decoration:drop_shadow yes"
  fi
  sleep 60
done
