#!bin/bash

# start the pod
kubectl -n kafka apply -f pod-minikube.yaml

# use kubectl exec to "log into" the pod
kubectl -n kafka exec pod-minikube -it bash

# run the following command to install required packages to operate the Kafka cluster
apt-get update
apt-get upgrade
apt-get install python3
apt-get install python3-pip
# update pip version
pip3 install --upgrade pip

# pip install confluent-kafka==1.1.0
pip install confluent-kafka
