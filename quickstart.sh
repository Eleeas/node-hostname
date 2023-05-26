# Start local cluster
minikube start

# Deploy deployment for the servers (using docker image with tag latest)
kubectl apply -f deploy/deployment.yaml
# Deploy loadbalancer service to expose the servers
kubectl apply -f deploy/service.yaml
# TODO: fix scaling
#kubectl apply -f deploy/hpa.yaml

# wait for pods to be ready
kubectl rollout status deployment node-hostname

# expose the service locally
minikube service node-hostname 