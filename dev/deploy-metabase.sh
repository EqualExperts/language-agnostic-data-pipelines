#!/bin/bash

# add Bitnami repo to Helm
helm repo add bitnami https://charts.bitnami.com/bitnami

# deploy postgresql to k8s cluster
helm install -n argo metabase-postgres bitnami/postgresql \
 --set global.postgresql.postgresqlUsername=metabase_user \
 --set global.postgresql.postgresqlPassword=metabase_password \
 --set global.postgresql.postgresqlDatabase=metabase \
 --set global.postgresql.servicePort=5433

helm repo add stable https://charts.helm.sh/stable --force-update --allow-deprecated-repos 

helm install -n argo  metabase -f metabase-config.yml stable/metabase