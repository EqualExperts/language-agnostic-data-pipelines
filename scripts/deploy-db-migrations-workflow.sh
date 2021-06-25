#!/bin/bash

# eval minikube docker env to make the local docker images available inside k8s cluster
eval $(minikube docker-env)

cd ../connectors/covid19-uk-ingestions

# create jar for db-migrations
make create_migrator_uberjar 

cd ../../

# create db-migrations image
docker build -f data-pipelines/db-migrations/Dockerfile -t db-migrations:latest .

# cleanup old runs
argo -n argo delete db-migrations-dev
argo -n argo delete db-migrations-test
# generate workflow using helm templating engine
helm template db-migrations data-pipelines/db-migrations --set environment=test --set name=db-migrations-test --output-dir outputs-test
helm template db-migrations data-pipelines/db-migrations --set environment=dev --set name=db-migrations-dev --output-dir outputs-dev


# submit db-migrations workflow to argo
argo -n argo submit --log  outputs-test/db-migrations/templates/workflow.yaml
argo -n argo submit --log  outputs-dev/db-migrations/templates/workflow.yaml