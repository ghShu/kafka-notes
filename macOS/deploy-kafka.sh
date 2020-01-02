#!/bin/bash
# cd macOS
# create `kafka` namespace is it does not already exist
# kafka create namespace kafka
helm install --name-template kafka-cluster --namespace kafka -f ../charts/kafka/values.yaml ../charts/kafka
