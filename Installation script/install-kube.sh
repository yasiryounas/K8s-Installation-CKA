#!/bin/sh

#For Debian system

sudo mkdir -m 755 /etc/apt/keyrings

#Ensure image is up to date
sudo apt update --allow-releaseinfo-change

#Install tools
sudo apt-get install -y apt-transport-https ca-certificates curl gpg

# Download the Kubernetes GPG key and save it to a dearmored keyring file
#curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.27/deb/Release.key | sudo gpg --dearmor -o /usr/share/keyrings/kubernetes-apt-keyring.gpg

##curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.27/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# Add the Kubernetes repository with the signed-by option pointing to the keyring
#echo 'deb [signed-by=/usr/share/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.27/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
##echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.27/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

#sudo apt-get update

# Download the Docker GPG key and save it to a dearmored keyring file
#curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg

# Make the Docker GPG key available for everyone
#sudo chmod a+r /usr/share/keyrings/docker.gpg

# Add the Docker repository with the signed-by option pointing to the keyring
# Note: Using the VERSION_CODENAME variable from /etc/os-release to add the correct repository for your version of Debian
e#cho "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update -y

echo 'Installing kubectl, kubelet, kubeadm'

sudo apt install -y kubectl kubelet kubeadm

sudo apt-mark hold kubelet kubeadm kubectl

sudo swapoff -a

sudo systemctl enable --now kubelet