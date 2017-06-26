arch-chroot /mnt useradd --create-home --groups wheel --shell /bin/bash n8henrie
arch-chroot /mnt sed -i 's/# \(%wheel ALL=(ALL) ALL\)/\1/' /etc/sudoers
