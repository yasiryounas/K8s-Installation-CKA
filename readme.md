Install Kubeadmn by following command
sudo kubeadm init

Download weavenet locally and then apply it with apply command

wget "https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml" -o weavenet.yaml
kubectl apply -f weavenet.yaml

To Join the Worker Node, get the kubeadm join command from master
kubeadm token create --print-join-command
and run the command got from here on worker Nodes with sude previlages 

check the logs of Weave net pods, 
kubectl logs podname -n kube-system -c weave

kubectl exec -n kube-system podname -c weave -- /home/weave/weave --local status

if there is any issue after the VM, connection to API server is refused.
then perform following steps,
sudo swapoff -a
sudo systemctl daemon-reload
sudo systemctl restart containerd
sudo systemctl restart kubelet 

For firewall verification, check the firewall status 
sudo systemctl status firewalld.service 
sudo firewall-cmd --list-all
sudo firewall-cmd --set-default-zone=internal

