#!/bin/bash

# deploy postgresql to k8s cluster
helm install -n argo metabase-postgres bitnami/postgresql \
 --set global.postgresql.postgresqlUsername=$METABASE_POSTGRES_USER \
 --set global.postgresql.postgresqlPassword=$METABASE_POSTGRES_PASS \
 --set global.postgresql.postgresqlDatabase=$METABASE_POSTGRES_DB \
 --set global.postgresql.servicePort=$METABASE_POSTGRES_PORT

helm repo add stable https://charts.helm.sh/stable --force-update --allow-deprecated-repos 

helm install -n argo  metabase -f metabase-config.yml stable/metabase

# make sure pg is ready to accept connections
until kubectl run postgres-postgresql-client --rm -i --restart='Never' --namespace argo --image docker.io/bitnami/postgresql:11.11.0-debian-10-r31 --env="PGPASSWORD=$METABASE_POSTGRES_PASS" --command -- pg_isready --host metabase-postgres-postgresql -U $METABASE_POSTGRES_USER -d $METABASE_POSTGRES_DB -p $METABASE_POSTGRES_PORT -t 30
do
  echo "Waiting for postgres"
  sleep 5;
done

kubectl run postgres-postgresql-client --rm -i --restart='Never' --namespace argo --image docker.io/bitnami/postgresql:11.11.0-debian-10-r31 --env="PGPASSWORD=$METABASE_POSTGRES_PASS" --command -- psql --host metabase-postgres-postgresql -U $METABASE_POSTGRES_USER -d $METABASE_POSTGRES_DB -p $METABASE_POSTGRES_PORT < metabase_dump.sql
