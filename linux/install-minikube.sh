#!/bin/bash

# reference: https://kubernetes.io/docs/tasks/tools/install-minikube/

# Check whether virturalization is supported on your Linux system. Yes, if you see 'VMX' in colored output.
grep -E --color 'vmx|svm' /proc/cpuinfo

# Install hypervisor.
# Any hypervisor works in your OS (KVM, VirtualBox or VMWare Fusion) should do the work.
# VirtualBox is chosen in this example.

# install minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
    && chmod +x minikube

# add executable to your PATH
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/

# Start minikube
minikube start --vm-driver=virtualbox

# Check status
minikube status


# Stop a cluster
# minkube stop


# Delete a cluster
# minkube delete
