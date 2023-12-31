sudo apt-get update -y
#Change the k8s version from repo /etc/apt/sources.list.d/kubernetes.list from 1.27 to 1.28
sudo apt-mark unhold kubeadm
sudo apt-get update
sudo apt-get install kubeadm='1.28.2-1.1' -y
sudo kubeadm upgrade plan 
sudo kubeadm upgrade apply v1.28.2
sudo apt-mark hold kubeadm 
# for other control plane node  
##sudo kubeadm upgrade node

##upgrade for Kubelet and kubectl 
sudo apt-mark unhold kubectl kubelet
apt-cache madison kubelet kubectl
kubectl drain master01 --ignore-daemonsets
sudo apt-get install kubelet='1.28.2-1.1' kubectl='1.28.2-1.1' -y
sudo apt-mark hold kubectl kubelet
sudo systemctl daemon-reload
sudo systemctl restart kubelet.service
kubectl uncordon master01