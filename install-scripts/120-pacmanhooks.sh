# Install pacman hooks
arch-chroot /mnt mkdir -p /etc/pacman.d/hooks
cat <<-END > /mnt/etc/pacman.d/hooks/clean_old.hook
# Clean pacman cache, leave the last 3 installed and the last uninstalled
[Trigger]
Operation = Install
Operation = Upgrade
Operation = Remove
Type = Package
Target = *

[Action]
Description = Removing old cached pacakges...
When = PostTransaction
Exec = /usr/bin/env bash -c "/usr/bin/paccache -vrk3; /usr/bin/paccache -vruk1;"
END
