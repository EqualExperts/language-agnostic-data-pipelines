#!/bin/bash

# add Bitnami repo to Helm
helm repo add bitnami https://charts.bitnami.com/bitnami

# deploy postgresql to k8s cluster
helm install -n argo postgres bitnami/postgresql \
 --set global.postgresql.postgresqlUsername=$COVID19_POSTGRES_USER \
 --set global.postgresql.postgresqlPassword=$COVID19_POSTGRES_PASS \
 --set global.postgresql.postgresqlDatabase=$COVID19_POSTGRES_DB \
 --set global.postgresql.servicePort=$COVID19_POSTGRES_PORT

# make sure pg is ready to accept connections
until kubectl run postgres-postgresql-client --rm -i --restart='Never' --namespace argo --image docker.io/bitnami/postgresql:11.11.0-debian-10-r31 --env="PGPASSWORD=$COVID19_POSTGRES_PASS" --command -- pg_isready --host postgres-postgresql -U $COVID19_POSTGRES_USER -d $COVID19_POSTGRES_DB -p $COVID19_POSTGRES_PORT -t 30
do
  echo "Waiting for postgres"
  sleep 2;
done

kubectl run postgres-postgresql-client --rm -i --restart='Never' --namespace argo --image docker.io/bitnami/postgresql:11.11.0-debian-10-r31 --env="PGPASSWORD=$COVID19_POSTGRES_PASS" --command -- psql --host postgres-postgresql -U $COVID19_POSTGRES_USER -d $COVID19_POSTGRES_DB -p $COVID19_POSTGRES_PORT < create_test_db.sql

