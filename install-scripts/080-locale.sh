arch-chroot /mnt sed -i 's/^#\(en_US.UTF-8 UTF-8\)/\1/' /etc/locale.conf
arch-chroot /mnt echo LANG=en_US.UTF-8 > /etc/locale.conf
arch-chroot /mnt locale-gen
