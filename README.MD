## Language Agnostic Data Pipelines (Using Argo and Dbt)

Usually the frameworks for data pipelines are python centric, so the goal of this project is to define a strategy/architecture that can be used by teams which use any programming languages without requiring the effor to have another programming language in the codebase. Also, believing that software engineers can contribute to the data space, an architecture for data pipelines that is not python centric can be usefull to increase the collaboration between software engineers and data engineers.

This project contains a sample use case that contains a data pipeline to ingest uk covid19 data (https://api.coronavirus.data.gov.uk). 

## Main concepts

### Connectors
Connectors are projects which ingest data from somewhere and write data into a staging table in a warehouse.
The covid19 connector is coded in clojure and it was developed using practises like tdd.
Connectors should support backfilling with custom dates if needed.

There is freedom to create connectors in different programming languages, the only requirement is each connector should be dockerized.

### Data models
Data models is a dbt project which contains the models that are created/transformed on each data pipeline.
Also, it contains data quality checks using dbt as well.

### Data pipelines
Data Pipelines are composed by Argo Workflows which orchestrate the connectors and the data models. 
For each data pipeline, it should be created a workflow template defining the DAG that represents the pipeline, and a cron workflow to schedule the template.

## Run (locally)
The project uses a local kubernetes cluster to deploy Argo, a sample database, and an instance of metabase wich is user friendly to see the data.
To run the project you need docker and jdk11 and the following requirements:

### Requirements (osx using homebrew):
```bash
brew install minikube
brew install kubectl
brew install argo
brew install helm
brew intall leiningen
```
Apart from general development tools like docker and jdk11.

### Deploy locally:

```bash
minikube start covid19_cluster
cd scripts
./deploy-argo.sh && ./deploy-db.sh && ./deploy-db-migrations-workflow.sh && ./deploy-covid19-workflow.sh && ./deploy-metabase.sh
```

### Walkthrough


### Argo Workflows 

During the deploy there are two workflows deployed on argo.
 - Data Migration workflow which creates the table needed for the example. The Migration is using a clojure library (ragtime) to handle migrations.
 - Covid19uk Data Pileine which is a cron workflow (runs every hour) that runs a template workflow that represents the pipeline. On the first run it will take around 30m.

 To access Argo you can portforward to the pod:

 ```bash
export ARGO_POD_NAME=$(kubectl get pods --namespace argo -l "app=argo-server" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward --namespace argo $ARGO_POD_NAME 2746:2746
```

See workflow dashboard (click on a workflow to see the details):

> http://localhost:2746/workflows/argo

See the cron workflow (you can trigger the cron manually):

> http://localhost:2746/cron-workflows/argo

See the workflow template which is the base workflow for the pipeline (it's possible to trigger the template with custom dates to make a backfill):

> http://localhost:2746/workflow-templates/argo


### Metabase 

There is an instance of metabase deployed with the example that allows to view the data. There is a pre-made
question created to show covid19 Data (just click in browse all items on the homepage)

```bash
export METABASE_POD_NAME=$(kubectl get pods --namespace argo -l "app=metabase,release=metabase" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward --namespace argo $METABASE_POD_NAME 8080:3000
```

> http://localhost:8080 (login: devuser@somemail.com / metabase_password1. )


#### Accessing DB

To access database directly:

```bash
 export POSTGRES_PASSWORD=$(kubectl get secret --namespace argo postgres-postgresql -o jsonpath="{.data.postgresql-password}" | base64 --decode)
 kubectl run postgres-postgresql-psql --rm --tty -i --restart='Never' --namespace argo --image docker.io/bitnami/postgresql:11.11.0-debian-10-r31 --env="PGPASSWORD=$POSTGRES_PASSWORD" --command -- psql --host postgres-postgresql -U covid19_user -d covid19_dev -p 5432
```


#### k9s
Instead of using the portforwaring on terminal, you can use k9s if you are familiar.

```bash
brew install k9s
```