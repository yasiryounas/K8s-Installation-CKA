sudo swapoff -a
systemctl enable firewalld.service
systemctl start firewalld.service
firewall-cmd --get-active-zones
firewall-cmd --permanent --add-port=6443/tcp --zone=external
firewall-cmd --permanent --add-port=6443/tcp --zone=internal
firewall-cmd --permanent --add-port=2379/tcp --zone=internal
firewall-cmd --permanent --add-port=2380/tcp --zone=internal
firewall-cmd --permanent --add-port=10250/tcp --zone=internal
firewall-cmd --permanent --add-port=10259/tcp --zone=internal
firewall-cmd --permanent --add-port=10257/tcp --zone=internal
firewall-cmd --permanent --add-port=6783/tcp --zone=internal
firewall-cmd --permanent --add-service=dns --zone=public
firewall-cmd --add-masquerade --permanent
firewall-cmd --reload