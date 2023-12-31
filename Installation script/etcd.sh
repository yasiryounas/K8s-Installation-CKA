#ETCDCLI Installation
wget https://github.com/etcd-io/etcd/releases/download/v3.5.10/etcd-v3.5.10-linux-amd64.tar.gz

tar xvf etcd-v3.5.10-linux-amd64.tar.gz
sudo mv ~/etcd-v3.5.10-linux-amd64/etcd* /usr/local/bin/

##execution via Pod Shell

kubectl exec etcd-cloudmemaster01 -n kube-system -- sh -c "ETCDCTL_API=3 etcdctl member list \
  --endpoints=https://192.168.60.11:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt  \
  --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key --write-out=table"

kubectl exec etcd-master01 -n kube-system -- sh -c "ETCDCTL_API=3 etcdctl endpoint status \
  --endpoints=https://192.168.60.11:2379,https://127.0.0.1:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt \
  --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key --write-out=table"

kubectl exec etcd-master01 -n kube-system -- sh -c "ETCDCTL_API=3 etcdctl version \
  --endpoints=https://192.168.60.11:2379,https://127.0.0.1:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt \
  --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key --write-out=table"

##ETCD backup restore, save and status via ETCDCTL command

 sudo etcdctl snapshot status etcd_backup_2023_4 --endpoints=https://127.0.0.1:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key --write-out=table

 sudo etcdctl snapshot save etcd_backup_2023_4 --endpoints=https://127.0.0.1:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt
--cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key

sudo etcdctl snapshot restore etcd_backup_2023_4 --endpoints=https://127.0.0.1:2379  ----data-dir /var/lib/etcd-backup/
##Move all the API server files from /var/kubernetes/manifest/ to home directory temporarily.
#change the location in kube etcd yaml for new data-dir location.
## move back Kube API files back to manifest location