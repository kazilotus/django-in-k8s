# django-helm

This project demonstrates using docker and helm to deploy a django application to a k8s cluster.

The django project being used is https://github.com/shacker/gtd which is a full implemtation of https://github.com/shacker/django-todo application.

Tools used in this project
- docker
- helm - package k8s resources
- podman - to install minikube in M1 Apple Chip Macbook
- minikube - setup a basic k8s cluster
- kubernetes

# Setup and connect to k8s cluster
```bash
# Install Minikube
brew install minikube
minikube start --kubernetes-version=v1.24.1

# If you face problem using minikube on a M1 Apple Chip try using podman
# Install Podman
brew install podman
podman machine init --cpus 2 --memory 2048 --rootful
podman machine start

# Minikube with podman
minikube start --kubernetes-version=v1.24.1 --driver=podman

# Optional command if you want to clear minikube
# minikube delete --all --purge
```

# To start the project in development mode run
```bash
sudo docker-compose up --build -d
```

# TODO

- [x] Run the application
- [x] Take conf from env
- [x] Dockerize the application for development
- [x] Docker compose for development mode
- [x] Postgres docker container for development
- [x] Setup k8s cluster using minikube
- [ ] Dockerize the application for prod
- [ ] Create a basic helm chart
- [ ] Add a deployment for the django app
- [ ] Add a statefulset for PostgreSQL
- [ ] Add config map and secrets for env
- [ ] Add an nginx ingress controller
- [ ] Write ansible role for building docker image
- [ ] Write ansible role for deploying helm chart