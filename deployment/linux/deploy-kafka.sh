#!/bin/bash
# cd macOS
# create `kafka` namespace is it does not already exist

# command to create `kafka` namespace
# kafka create namespace kafka

# helm install kafka-cluster into kubernetes cluster
helm install --name kafka-cluster --namespace kafka -f ../charts/kafka/values.yaml ../charts/kafka
