
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

# project requirements

## use separate namespace for Jenkins's deployment and application's deployment 
```bash
kubectl create namespace Jenkins
kubectl create namespace myppp
```

![Screenshot from 2022-11-16 21-03-00](https://user-images.githubusercontent.com/29188579/202277025-c3c36b29-9f61-4c87-9fee-ba7790544f76.png)

![Screenshot from 2022-11-16 21-03-10](https://user-images.githubusercontent.com/29188579/202277057-6c5eb838-27b6-4f5d-b1d8-dfa3e5b024dd.png)


## use github
![Screenshot from 2022-11-16 20-09-58](https://user-images.githubusercontent.com/29188579/202277487-0a35fc86-9aaf-4f5d-9539-041af9b2e2fc.png)
 webhook




