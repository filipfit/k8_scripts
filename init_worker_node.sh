#! /usr/bin/bash
# Author: Markos Genios, Filip Fitzermann
# Assumes running on Ubuntu 20.04


# apt update
sudo apt update -y
sudo apt upgrade -y

# Permanently disable swap
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

# Install Docker
sudo apt install -y docker.io
sudo systemctl enable --now docker

# Install auxiliary packages
sudo apt install -y apt-transport-https ca-certificates curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update

# Install kubelet, kubeadm and kubectl and prevent them from being updated in the future
sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
