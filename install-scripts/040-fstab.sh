genfstab -p /mnt >> /mnt/etc/fstab
sed -i '/swap/ s/^/# /' /mnt/etc/fstab
