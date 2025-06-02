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
    -netdev user,id=net0,hostfwd=tcp::10020-:22 \
    -device e1000,netdev=net0 \

# qemu-system-x86_64 -enable-kvm -bios /usr/share/edk2/x64/OVMF.fd -cdrom /mnt/D/IsoImages/void-live-x86_64-20230628-base.iso -boot menu=on -drive file=~/vms/void.img -m 2G -cpu host -smp 4 -vga virtio -display sdl,gl=on 

