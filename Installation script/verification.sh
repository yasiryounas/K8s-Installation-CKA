sudo cat /sys/class/dmi/id/product_uuid

lsmod | grep br_netfilter
lsmod | grep overlay

sysctl net.bridge.bridge-nf-call-iptables net.bridge.bridge-nf-call-ip6tables net.ipv4.ip_forward

#apt-cache/yum madison kubeadm