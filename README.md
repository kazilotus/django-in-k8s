# django-in-k8s

This project demonstrates using docker and helm to deploy a django application to a k8s cluster.

The django project being used is https://github.com/shacker/gtd which is a full implemtation of https://github.com/shacker/django-todo application.

<img width="1278" alt="django-todo" src="https://user-images.githubusercontent.com/11974463/178183956-a2f5733b-e642-484c-94ee-83b3a1e67943.png">

# Tools

## Tools used in this project
- ansible - build and deploy helm chart to k8s cluster
- docker - container engine
- helm - package k8s resources
- helmfile - install multiple charts at once
- podman - to install minikube in M1 Apple Chip Macbook
- minikube - setup a basic k8s cluster
- kubernetes - container orchestration

## Tools used for dockerizing the django app
- uWSGI
- Caddy web server
- Supervisord

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
ansible-playbook playbook.yaml | tee output.log
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
# Stop Podman Machine
podman machine stop podman-machine-default
# Remove Podman Machine
podman machine rm podman-machine-default
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
- [x] Dockerize the application for prod
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
- [x] Write ansible task for building docker image
- [x] Write ansible task for deploying helm chart

# Notes

- Instead of building the docker image in host system, the image is being built inside podman using minikube docker daemon. Although this significantly increases the build time, its a quick fix for avoiding M1/Arm architecture related issues.
