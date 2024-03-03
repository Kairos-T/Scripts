#!/bin/bash
sudo apt update
sudo apt install -y qemu qemu-kvm libvirt-daemon virt-manager libvirt-daemon-system virtinst bridge-utils libvirt-clients

if kvm-ok > /dev/null 2>&1; then
    echo "KVM acceleration is set up correctly. Continuing..."
else
    echo "Error: KVM acceleration cannot be used. Exiting!"
    exit 1
fi

sudo systemctl enable --now libvirtd
sudo systemctl start libvirtd

sudo usermod -aG kvm $USER
sudo usermod -aG libvirt $USER

sudo systemctl restart libvirtd

echo "KVM has been set up successfully!"