#!/bin/bash

# eval minikube docker env to make the local docker images available inside k8s cluster
eval $(minikube docker-env)

cd ../workflow-tasks/covid19-uk-ingestions

# create jar for db-migrations
make create_migrator_uberjar 

cd ../../

# create db-migrations image
docker build -f workflows/db-migrations/Dockerfile -t db-migrations:latest .

# cleanup old runs
argo -n argo delete db-migrations

# generate workflow using helm templating engine
helm template db-migrations workflows/db-migrations --set environment=dev --set name=db-migrations --output-dir outputs

# submit db-migrations workflow to argo
argo -n argo submit --log  outputs/db-migrations/templates/workflow.yaml
