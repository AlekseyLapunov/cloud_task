#!/usr/bin/bash

# Build docker image
cd ./app && ./docker_build.sh && cd ../

# Create cluster via kind
kind create cluster -n cloudy-cluster

# Load local docker image into created kind cluster
kind load docker-image cloudy-py -n cloudy-cluster

# Install helm chart
cd ./helm && helm install cloudy-chart . --values ./values.yaml && cd ../

# Show kubectl namespaces and created pods
kubectl get namespaces

# Pending status
echo Waiting pods in the pending status... && sleep 10s
kubectl get pods -n cloudy 

# Ready status
echo Waiting pods in the ready status... && sleep 6s
kubectl get pods -n cloudy