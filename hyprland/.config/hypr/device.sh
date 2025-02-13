#!/bin/sh
cards="$(ls -l /dev/dri/by-path | grep pci-0000:01:00.0-card)"

data=($cards)

echo "env = AQ_DRM_DEVICES, /dev/dri""${data[10]}" | tr -d . > device.conf

