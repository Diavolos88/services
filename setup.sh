minikube delete
minikube start --vm-driver=docker

eval $(minikube docker-env)

minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons enable metallb
# minikube addons enable ingress

# kubectl get configmap kube-proxy -n kube-system -o yaml | sed -e "s/strictARP: false/strictARP: true/" | kubectl diff -f - -n kube-system
# kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.7.3/manifests/metallb.yaml
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
# export DOCKER_HOST="tcp://127.0.0.1:32782"
cd ./srcs

kubectl apply -f ./metallb.yaml

docker build -t mysql ./mysql 
docker build -t influxdb ./influxdb
docker build -t nginx ./nginx 
docker build -t wordpress ./wordpress
docker build -t phpmyadmin ./phpmyadmin
docker build -t ftps ./ftps
docker build -t grafana ./grafana 

kubectl create -f ./mysql/mysql.yaml
kubectl create -f ./influxdb/influxdb.yaml
sleep 30
kubectl create -f ./nginx/nginx.yaml
kubectl create -f ./wordpress/wordpress.yaml
kubectl create -f ./phpmyadmin/phpmyadmin.yaml
kubectl create -f ./ftps/ftps.yaml
kubectl create -f ./grafana/grafana.yaml

minikube dashboard