#!/bin/bash

# wait for the network to come up
while true
do
  ping -c1 google.com &> /dev/null && break
done

# clone the repository
git clone https://github.com/n8henrie/arch-installer.git

# run each installation script in sequence, logging the results
mkdir logs
cd arch-installer/install-scripts
for i in *.sh
do
  echo $i
  bash -x $i &>> ~/logs/${i%.sh}.out
done
