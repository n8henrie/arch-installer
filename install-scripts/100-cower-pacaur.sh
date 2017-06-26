cat <<-END | arch-chroot /mnt su -l n8henrie
cd /tmp
git clone https://aur.archlinux.org/cower.git
cd cower
makepkg -s --noconfirm
END

cat <<-END | arch-chroot /mnt
gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53
pacman --noconfirm -U /tmp/cower/*.tar.xz
rm -rf /tmp/cower
END

cat <<-END | arch-chroot /mnt su -l n8henrie
cd /tmp
cower -d pacaur
cd pacaur
makepkg -s --noconfirm
END

cat <<-END | arch-chroot /mnt
pacman --noconfirm -U /tmp/pacaur/*.tar.xz
rm -rf /tmp/pacaur
END
