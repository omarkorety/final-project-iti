
# deploy backend application on kubernetes cluster using CI/CD Jenkins pipeline

first create infrastructure using terraform 
## infrastructure for my project using terraform
decribe instructions for initiate the project
```bash
terraform init 
terraform validate #to make sure there no syntax errors
terraform plan #to make sure everything will be created
terraform graph | dot -Tsvg > graph.svg
terraform apply #to apply my infrastructure on cloud provider 
```

```
![graph](https://user-images.githubusercontent.com/29188579/202273007-1ff4e2eb-1994-4e5f-8c81-df38e02a0bb6.svg)

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
    
