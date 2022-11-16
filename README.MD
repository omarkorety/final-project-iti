
# deploy backend application on kubernetes cluster using CI/CD Jenkins pipeline

first create infrastructure using terraform 
## deploy jenkins and Loadbalancer service in cluster 

build image for jenkins using Dockerfile by
```bash
terraform init 
terraform validate #to make sure there no syntax errors
terraform plan #to make sure everything will be created
terraform graph | dot -Tsvg > graph.svg
terraform apply #to apply my infrastructure on cloud provider 
```

deploy and configure Jenkins on the created K8s cluster 

## build jenkins

build image for jenkins using Dockerfile by
```bash
  docker build -t omarkorey/myjenkins:V1 .
  docker push omarkorey/myjenkins:V1 
```

## deploy jenkins and Loadbalancer service in cluster 

build image for jenkins using Dockerfile by
```bash
kubectl create -f deployment.yaml
```
    
