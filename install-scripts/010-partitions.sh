mounted_device=$(mount | grep -o /dev/sd. | head -n 1)
device=$(
  blkid | grep -o /dev/sd. | sort | uniq \ # Get a unique list of all devices
  | grep -v $mounted_device # filter out the mounted device, leaving the unmounted volume
  )

(
  echo o # New GPT partition table
  echo n # New partition
  echo 1 # Partition number
  echo # Accept default start sector
  echo +300M # Size
  echo 8300 # Filetype is Linux filesystem
  echo c
  echo 1
  echo boot

  echo n # New partition
  echo 2 # Partition number
  echo # Accept default start sector
  echo +20G # Size
  echo 8300 # Filetype is Linux filesystem
  echo c
  echo 2
  echo root

  echo n # New partition
  echo 3 # Partition number
  echo # Accept default start sector
  echo +10G # Size
  echo 8300 # Filetype is Linux filesystem
  echo c
  echo 3
  echo var

  echo n # New partition
  echo 4 # Partition number
  echo # Accept default start sector
  echo -4G # Size
  echo 8300 # Filetype is Linux filesystem
  echo c
  echo 4
  echo home

  echo n # New partition
  echo 5 # Partition number
  echo # Accept default start sector
  echo # Accept default end (take remaining space)
  echo 8200 # Filetype is swap
  echo c
  echo 5
  echo swap

  echo w # Write changes
) | sudo gdisk $device

yes | mkfs.ext4 -L boot ${device}1
yes | mkfs.ext4 -L root ${device}2
yes | mkfs.ext4 -L var ${device}3
yes | mkfs.ext4 -L home ${device}4
mkswap ${device}5
swapon ${device}5

mount ${device}2 /mnt
mkdir -p /mnt/{boot,home,var}
mount ${device}3 /mnt/var
mount ${device}4 /mnt/home
