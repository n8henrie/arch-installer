mkdir -p /mnt/var/cache/pacman/pkg
cp ~/packages/* /mnt/var/cache/pacman/pkg

rm -rf /var/cache/pacman/pkg
ln -s /mnt/var/cache/pacman/pkg /var/cache/pacman/pkg

pacstrap -c /mnt base base-devel archiso $(cat ~/packages/packages.both)
