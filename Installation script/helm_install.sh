wget https://get.helm.sh/helm-v3.7.0-linux-amd64.tar.gz && tar xvf helm-v3.7.0-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin
helm version
rm helm-v3.7.0-linux-amd64.tar.gz && rm -rf linux-amd64
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install ingress-nginx ingress-nginx/ingress-nginx