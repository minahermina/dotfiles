#!/bin/sh
#
diskImages=$(ls ~/vms/)

diskImage=$(echo  "$diskImages" | dmenu -i -p "Choose a Disk Image:")



qemu-system-x86_64 \
    -enable-kvm \
    -bios /usr/share/edk2/x64/OVMF.4m.fd \
    -boot menu=on \
    -drive file=/home/mina/vms/"$diskImage" \
    -m 4G \
    -cpu host \
    -smp 4 \
    -vga virtio \
    -display gtk,gl=on \
    # -netdev user,id=net0,hostfwd=tcp::10022-:22 \
   # -chardev socket,path=/tmp/port1,server=on,wait=off,id=port1-char \
   # -device virtio-serial \
   # -device virtserialport,id=port1,chardev=port1-char,name=mina-ssh \
   -net user,hostfwd=tcp::10022-:22 \
   # -net nic \
   #
   # -usb \
   # -device usb-tablet \
   # -chardev spicevmc,name=usbredir,id=usbredirchardev1 \
   # -device usb-redir,chardev=usbredirchardev1,id=usbredirdev1 \
   # -chardev spicevmc,name=usbredir,id=usbredirchardev2 \
   # -device usb-redir,chardev=usbredirchardev2,id=usbredirdev2 \
   # -chardev spicevmc,name=usbredir,id=usbredirchardev3 \
   # -device usb-redir,chardev=usbredirchardev3,id=usbredirdev3 \
   # -chardev spicevmc,name=usbredir,id=usbredirchardev4 \
   # -device usb-redir,chardev=usbredirchardev4,id=usbredirdev4 \
   # -chardev spicevmc,name=usbredir,id=usbredirchardev5 \
   # -device usb-redir,chardev=usbredirchardev5,id=usbredirdev5 \
# qemu-system-x86_64 -enable-kvm -bios /usr/share/edk2/x64/OVMF.fd -cdrom /mnt/D/IsoImages/void-live-x86_64-20230628-base.iso -boot menu=on -drive file=~/vms/void.img -m 2G -cpu host -smp 4 -vga virtio -display sdl,gl=on 

