#!/bin/bash

# add Bitnami repo to Helm
helm repo add bitnami https://charts.bitnami.com/bitnami

# deploy postgresql to k8s cluster
helm install -n argo postgres bitnami/postgresql \
 --set global.postgresql.postgresqlUsername=covid19_user \
 --set global.postgresql.postgresqlPassword=covid19_password \
 --set global.postgresql.postgresqlDatabase=covid19_dev \
 --set global.postgresql.servicePort=5432