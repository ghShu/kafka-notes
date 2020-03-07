#!/bin/bash

# Check whether virturalization is supported on macOS. Yes, if you see 'VMX' in colored output.
sysctl -a | grep -E --color 'machdep.cpu.features|VMX'

# Install hypervisor.
# Any hypervisor (HyperKit, VirtualBox or VMWare Fusion) should do the work, HyperKit is a lightweight option for Mac.
# If Docker for Desktop is installed, you already have hyperkit
# Otherwise, brew it
brew install hyperkit

# If you want, you may build it from here:
# https://github.com/moby/hyperkit


# install minikube
brew install minikube
brew link hyperkit

# Start minikube
minikube start --vm-driver=hyperkit

# Check status
minikube status


# Stop the cluster
# minkube stop
