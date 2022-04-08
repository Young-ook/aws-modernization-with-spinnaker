---
title: "Install Kubernetes CLI"
chapter: false
weight: 11
---

The Kubernetes command-line tool, [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-linux), allows you to run commands against Kubernetes clusters. You can use kubectl to deploy applications, inspect and manage cluster resources, and view logs.

Follow the instructions below to install kubernetes cli on your workspace. This is a commend to download the latest stable version for linux environment.
```sh
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
```

When the download is complete, add execute permissions to the binary file.
```sh
chmod +x ./kubectl
```

Copy the file to the path shown below for use by all users on the system.
```sh
sudo mv ./kubectl /usr/local/bin/kubectl
```

Print the Kubernetes-cli version to verify the installation. If the version information is displayed, the installation is complete. 
```sh
kubectl version --client
```
