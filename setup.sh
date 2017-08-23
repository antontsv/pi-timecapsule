#!/usr/bin/env bash

disk_name="sdb"
user="mac_timemachine"
mount_point="/mnt/TimeMachine"
sudo apt-get update
sudo apt-get install -y netatalk
lsblk -o KNAME,TYPE,SIZE,MODEL
read -rp "Choose disk [example: sda]:" disk_name

if ! lsblk "/dev/$disk_name" 1>/dev/null 2>&1;then
    echo "Selected disk is not recognized: $disk_name"
    exit 1
fi;
sudo mkdir "$mount_point"
echo "/dev/$disk_name $mount_point auto defaults 0 2" | sudo tee -a /etc/fstab
sudo mount "/dev/$disk_name"
echo "/mnt/TimeMachine \"Time Machine\" options:tm" | sudo tee -a /etc/netatalk/AppleVolumes.defausudo useradd $user
echo "Set password for $user..."
sudp passwd $user
sudo service netatalk restart
