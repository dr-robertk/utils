#!/usr/bin/bash

# run this as root
# sudo su

mount -o remount,rw /
mkdir -p {/userdata/system-data,}/etc/waydroid-extra
mount -o bind /userdata/system-data/etc/waydroid-extra /etc/waydroid-extra
mkdir -p /etc/waydroid-extra/images
echo '/etc/waydroid-extra auto persistent none none' >> /etc/system-image/writable-paths

images_url=https://sourceforge.net/projects/aleasto-lineageos/files/LineageOS%2020/waydroid_arm64
wget $images_url/system.img/download -O /etc/waydroid-extra/images/system.img
wget $images_url/vendor.img/download -O /etc/waydroid-extra/images/vendor.img

waydroid init -f
# exit              # from the root shell as you can't run e.g. "waydroid show-full-ui" as root
