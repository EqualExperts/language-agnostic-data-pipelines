#!/bin/bash

# create namespace argo on k8s cluster
kubectl create ns argo

# deploy argo on k8s cluster using default install
kubectl apply -n argo -f https://raw.githubusercontent.com/argoproj/argo-workflows/stable/manifests/quick-start-postgres.yaml
