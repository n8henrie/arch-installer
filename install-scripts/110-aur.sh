# Install pyenv and the latest python3
cat <<-END | arch-chroot /mnt su -l n8henrie
pacaur --noconfirm --noedit -S pyenv-git
pyenv install $(pyenv install -l | grep -P ' 3\.\d+\.\d+$' | tail -n 1)
END
