# django-in-k8s

This project demonstrates using docker and helm to deploy a django application to a k8s cluster.

The django project being used is https://github.com/shacker/gtd which is a full implemtation of https://github.com/shacker/django-todo application.

# Tools
## Tools used in this project
- ansible - build and deploy helm chart to k8s cluster
- docker - container engine
- helm - package k8s resources
- helmfile - install multiple charts at once
- podman - to install minikube in M1 Apple Chip Macbook
- minikube - setup a basic k8s cluster
- kubernetes - container orchestration

# Usage
## Install Homebrew and Ansible
```bash
# Install Homebrew
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Ansible
brew install ansible
```
## Run Ansible playbook to setup and deploy app into k8s cluster
```bash
# Run Ansible Script
cd ansible
ansible-playbook playbook.yaml
```

## Enable Minikube loadbalancer
```bash
minikube tunnel
```

## Access the webapp
Finally to access the webapp; headover to https://localhost

## Cleanup
```bash
# Clear minikube
minikube delete --all --purge
```

# Development

Start docker-desktop on your computer then run the following command in your terminal

```bash
sudo docker-compose up --build -d
```

# Todo

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
- [ ] Encrypt helm secrets
- [x] Write ansible task for generating trusted selfsigned CA cert
- [x] Write ansible task for installing all dependencies
- [ ] Write ansible task for building docker image
- [x] Write ansible task for deploying helm chart