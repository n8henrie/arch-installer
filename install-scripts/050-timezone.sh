arch-chroot /mnt ln -sf /usr/share/zoneinfo/US/Mountain /etc/localtime
arch-chroot /mnt hwclock --systohc --utc
