sudo swapoff -a
systemctl enable firewalld.service
systemctl start firewalld.service
firewall-cmd --get-active-zones
firewall-cmd --permanent --add-port=10250/tcp --zone=internal
firewall-cmd --permanent --add-port=30000-32767/tcp --zone=internal
firewall-cmd --permanent --add-port=30000-32767/tcp --zone=external
firewall-cmd --permanent --add-port=6783/tcp --zone=internal
firewall-cmd --add-masquerade --permanent
firewall-cmd --reload