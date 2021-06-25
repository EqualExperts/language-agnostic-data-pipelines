#!/bin/bash

# add Bitnami repo to Helm
helm repo add bitnami https://charts.bitnami.com/bitnami

# deploy postgresql to k8s cluster
helm install -n argo postgres bitnami/postgresql \
 --set global.postgresql.postgresqlUsername=covid19_user \
 --set global.postgresql.postgresqlPassword=covid19_password \
 --set global.postgresql.postgresqlDatabase=covid19_dev \
 --set global.postgresql.servicePort=5432

sleep 10

kubectl run postgres-postgresql-client --rm -i --restart='Never' --namespace argo --image docker.io/bitnami/postgresql:11.11.0-debian-10-r31 --env="PGPASSWORD=covid19_password" --command -- psql --host postgres-postgresql -U covid19_user -d covid19_dev -p 5432 < create_test_db.sql
