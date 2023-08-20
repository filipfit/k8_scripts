#! /usr/bin/bash

sudo apt install -y qemu-kvm
sudo apt install -y virt-manager
sudo usermod -a -G libvirt $USER
