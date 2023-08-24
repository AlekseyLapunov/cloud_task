#!/usr/bin/bash

# Uninstall created helm chart
helm uninstall cloudy-chart

# Delete kind cluster
kind delete cluster -n cloudy-cluster