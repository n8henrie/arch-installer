cat <<-END | arch-chroot /mnt su -l n8henrie
git clone --depth=1 https://aur.archlinux.org/yay-bin.git
pushd yay-bin
makepkg -sirc --noconfirm
END
