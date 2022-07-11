# Ansible

Variables for used in the playbook are stored in variables.yaml

The playbook consists of the following tasks in order

### Prepare system by installing all dependencies
  - podman
  - minikube
  - kubectl
  - helm
  - helmfile
  - mkcert
  - nss

### Install and Setup Podman
At first I tried to setup minikube on my M1 Macbook but ran into many issues. Later found out that it works perfectly on podman although its still in an experimental stage.
After installation it proceeds to creating a VM with 4GB RAM and 4 Core CPU

### Start Minikube
Minikube starts a kubernetes cluster with version 1.24.1 using the podman driver. Takes a couple of minute to setup.

### Helmfile
Helmfile is a tool with which all helm charts, their dependenies, values, order/sequences, wait period, etc can be managed. It's a must have for anyone working with many helm charts.
Helm plugin "diff" is installed then which helmfile uses to compare any resources definitions and current cluster state to determine what to deploy.

### Self Signed Trusted TLS Certificate
Since we are trying to deploy production grade application, not having an SSL secured test endpoint just didn't feel right. So after installing cert-manager and its native self-signed certificate issuer, for security reasons chrome does not even let us view the page, rendering self signed ssl unusable.

Look into https://github.com/FiloSottile/mkcert. Mkcert is a tool that installs a CA cert in systems trusted store and the resulting Root CA can be used to sign any domain name resulting in the system and browser trusting the selfsigned tls certificate.

So the first the Root CA certs are generate in the cert-manager directory under /helm/charts. Then they are added to the k8s cluster as a secret in the same namespace where cert-manager will be deployed.

A ClusterIssuer and Certificate is deployed with the application chart that automatically issues certificate and loads it in the nginx class ingress

### Build docker image

Since minikube has its own docker daemon inside the podman machine, image built on the host system isn't accessible from inside minikube as local images. It is possible to copy over the image to minikube registry using `minikube image load {Image Tag}`. Although this worked perfectly well and quite fast, there were some issue with building images in arm architecture and then running them in amd architecture inside linux. So as a quick workaroud the images are being built inside minikube by exposing the docker daemon inside minikube.

### Deploying Charts

Finally all the helm charts are deployed in appropriate order in the kuberneted cluster
