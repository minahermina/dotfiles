#!/bin/sh

diskImages=$(ls ~/vms/)
diskImage=$(echo "$diskImages" | dmenu -l 5 -i -p "Choose a Disk Image:")

# Check if port is free using fuser or netcat
is_port_free() {
    port="$1"
    if command -v fuser >/dev/null 2>&1; then
        # fuser detects if anything is listening on the port
        fuser -n tcp "$port" >/dev/null 2>&1
        [ $? -ne 0 ] && return 0 || return 1
    else
        # fallback: netcat
        nc -z 127.0.0.1 "$port" >/dev/null 2>&1
        [ $? -ne 0 ] && return 0 || return 1
    fi
}

find_free_port() {
    port=10020
    while :; do
        is_port_free "$port" && break
        port=$((port + 1))
    done
    echo "$port"
}

host_port=$(find_free_port)
echo "Using host port: $host_port for SSH forwarding"

qemu-system-x86_64 \
    -enable-kvm \
    -bios /usr/share/edk2/x64/OVMF.4m.fd \
    -boot menu=on \
    -drive file="/home/mina/vms/$diskImage" \
    -m 4G \
    -cpu host \
    -smp 4 \
    -vga virtio \
    -display gtk,gl=on \
    -netdev user,id=net0,hostfwd=tcp::"$host_port"-:22 \
    -device e1000,netdev=net0
# qemu-system-x86_64 -enable-kvm -bios /usr/share/edk2/x64/OVMF.fd -cdrom /mnt/D/IsoImages/void-live-x86_64-20230628-base.iso -boot menu=on -drive file=~/vms/void.img -m 2G -cpu host -smp 4 -vga virtio -display sdl,gl=on 

# aarch64
# qemu-system-aarch64 -bios /usr/share/edk2/aarch64/QEMU_EFI.fd -cdrom /home/mina/void-live-aarch64-20250202-xfce.iso -boot menu=on -drive file=~/vms/kali.img -m 2G -cpu cortex-a57 -smp 4 -device ramfb -display gtk,gl=on -machine virt

