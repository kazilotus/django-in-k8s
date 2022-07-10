# django-helm

This project demonstrates using docker and helm to deploy a django application to a k8s cluster.

The django project being used is https://github.com/shacker/gtd which is a full implemtation of https://github.com/shacker/django-todo application.

Tools used in this project
- ansible - build and deploy helm chart to k8s cluster
- docker - container engine
- helm - package k8s resources
- helmfile - install multiple charts at once
- podman - to install minikube in M1 Apple Chip Macbook
- minikube - setup a basic k8s cluster
- kubernetes

# Start the project in development mode

Start docker-desktop on your computer then run the following command in your terminal

```bash
sudo docker-compose up --build -d
```

# Setup and connect to k8s cluster
```bash
# Install Minikube
brew install minikube
minikube start --kubernetes-version=v1.24.1

# If you face problem using minikube on an M1 Apple Chip try using podman
# Install Podman
brew install podman
podman machine init --cpus 2 --memory 2048 --rootful
podman machine start

# Minikube with podman
minikube start --kubernetes-version=v1.24.1 --driver=podman

# Optional command if you want to clear minikube
# minikube delete --all --purge
```
# Deploy to k8s cluster
```bash
# Install Dependencies

## Helmfile
# Install helmfile
brew install helmfile

# Helm diff plugin
helm plugin install https://github.com/databus23/helm-diff

## Ansible
# Install Ansible Ansible Script
brew install ansible

# Run Ansible Script
ansible-playbook
```

# Enable Minikube loadbalancer
```bash
minikube tunnel
```

# Access the webapp
Finally to access the webapp headover to https://localhost

# TODO

- [x] Run the application
- [x] Take settings from env
- [x] Dockerize the application for development
- [x] Docker compose for development mode
- [x] Postgres docker container for development
- [x] Setup k8s cluster using minikube
- [ ] Dockerize the application for prod
- [x] Create a basic helm chart
- [x] Add a deployment for the django app
- [x] Install postgresql chart
- [x] Make postgresql chart volume persistent
- [x] Add config map and secrets for env
- [x] Add an nginx ingress controller
- [x] Install cert manager for self signed ssl key
- [x] Trust certmanager self signed ssl key
- [ ] Encrypt helm secrets
- [x] Write ansible task for installing all dependencies
- [ ] Write ansible task for building docker image
- [x] Write ansible task for deploying helm chart