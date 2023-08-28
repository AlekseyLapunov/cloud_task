#!/usr/bin/bash

# Build docker image
cd ./app && ./docker_build.sh && cd ../

# Create cluster via kind
kind create cluster -n cloudy-cluster

# Load local docker image into created kind cluster
kind load docker-image cloudy-py -n cloudy-cluster

# Install helm chart
cd ./helm && helm install cloudy-chart . --values ./values.yaml && cd ../

# Show kubectl namespaces
kubectl get namespaces

# Show pods
echo Waiting pods to show... && sleep 10s
kubectl get pods -n cloudy 
