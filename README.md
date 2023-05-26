# Instructions

Deploy everything (inspect the script for details):
```
sudo chmod +x quickstart.sh 
./quickstart.sh
```

Update docker image (request password from admin):
```
sudo chmod +x update-image.sh 
./update-image.sh -p <password>
```

Delete cluster:
```
minikube delete
```

# Todo

- setup production docker repo for Kent AB 
- naming convention for release tags
- Setup git CI/CD pipeline with built in tests
- Deploy to cloud environment instead of minikube
- Deploy to multi-node environment for redundancy
- metrics (prometheus/grafana etc)
- investigate what hardware and scaling to use to ensure availability (check average and peak load usage)
- make deploy/hpa.yaml scale based on needs instead of specifying static replicas in deploy/deployment.yaml
- make mock tests for scaling and fault tolerance (include usage of /crash endpoint)
- Expose via https (SSL cert, modify server code, firewall, setup dns, ddos protection,  etc)
- Helm-ify deployment
- probably a LOT of more stuff for compliant kubernetes https://elastisys.io/compliantkubernetes/img/comparison-chart.png
