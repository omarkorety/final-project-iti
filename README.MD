# Project structure


![WhatsApp Image 2022-11-10 at 1 36 46 AM](https://user-images.githubusercontent.com/29188579/202280547-2288fa35-4fbb-4645-b85d-e181717e8ce6.jpeg)


## Tools
- Terraform
- Google Cloud Platform (GCP)
- Jenkins

# deploy backend application on kubernetes cluster using CI/CD Jenkins pipeline

First create infrastructure using terraform 

## Infrastructure for my project using terraform
Decribe instructions for initiate the project
```bash
terraform init 
terraform validate #to make sure there no syntax errors
terraform plan #to make sure everything will be created
terraform graph | dot -Tsvg > graph.svg
terraform apply #to apply my infrastructure on cloud provider 
```
![graph](https://user-images.githubusercontent.com/29188579/202273007-1ff4e2eb-1994-4e5f-8c81-df38e02a0bb6.svg)

Deploy and configure Jenkins on the created K8s cluster 

## Duild jenkins

Build image for jenkins using Dockerfile by
```bash
  docker build -t omarkorey/myjenkins:V1 .
  docker push omarkorey/myjenkins:V1 
```

Dockerhub jenkins image repository: https://hub.docker.com/repository/docker/omarkorety/myjenkins

## Deploy jenkins and Loadbalancer service in cluster 

Build image for jenkins using Dockerfile by
```bash
kubectl create -f deployment.yaml
```

# Project requirements

## Use separate namespace for Jenkins's deployment and application's deployment 
```bash
kubectl create namespace Jenkins
kubectl create namespace myppp
```

![Screenshot from 2022-11-16 21-03-00](https://user-images.githubusercontent.com/29188579/202277025-c3c36b29-9f61-4c87-9fee-ba7790544f76.png)

![Screenshot from 2022-11-16 21-03-10](https://user-images.githubusercontent.com/29188579/202277057-6c5eb838-27b6-4f5d-b1d8-dfa3e5b024dd.png)


## Use github webhook
![Screenshot from 2022-11-16 20-09-58](https://user-images.githubusercontent.com/29188579/202277487-0a35fc86-9aaf-4f5d-9539-041af9b2e2fc.png)
 webhook


# project final screenshot
![Screenshot from 2022-11-16 19-40-25](https://user-images.githubusercontent.com/29188579/202278759-4a484726-8c76-49ec-95fe-5465dab87766.png)

![Screenshot from 2022-11-16 13-50-42](https://user-images.githubusercontent.com/29188579/202290119-c2bb52e0-1cf1-4f84-b0cd-5df397ab07ba.png)

# My appplication repo 
https://github.com/omarkorety/simple-app

# My application link 
http://35.234.0.45:5000/


## Lessons Learned

I learned how to configure kubernetes cluster on GCP,acquired experiences on GCP platform and learned how to use all the tools together for development life cycle 
