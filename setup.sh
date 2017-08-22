#!/usr/bin/env bash

disk_name="sdb"
user="mac_timemachine"
sudo apt-get update
sudo apt-get install -y netatalk
lsblk -o KNAME,TYPE,SIZE,MODEL
sudo mkdir /mnt/TimeMachine
echo "/dev/$disk_name /mnt/TimeMachine auto defaults 0 2" | sudo tee -a /etc/fstab
sudo mount "/dev/$disk_name"
echo "/mnt/TimeMachine \"Time Machine\" options:tm" | sudo tee -a /etc/netatalk/AppleVolumes.defausudo useradd $user
echo "Set password for $user..."
sudp passwd $user
sudo service netatalk restart
