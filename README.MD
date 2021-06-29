# Language Agnostic Data Pipelines

In some situations a tool like Matillion, Stitchdata or Fivetran can be a quick and reliable way to achieve the client's needs, although it’s not the best choice for all of our clients. 
These ETL tools work  well when using the existing connectors, although when the majority of the cases do not use the premade connectors, it’s certainly not the best approach. There is also an extra price when using these tools, apart from the usual cost. Making the data pipelines working in a CI/CD environment is always harder. So, in some cases, it’s preferable to make a code-friendly approach to data pipelines.

#### Main Requirements:   
- Easy to orchestrate and support scheduling, backfilling and manual triggering
- Testable
- Easy to integrate with custom APIs as sources of data
- Easy to integrate in a CI/CD environment
- The code can be developed in multiple languages to fit each client skill set when python is not a first class citizen. 
- Run in different clouds (aws, gcp)

This repository contains a reference implementation for a language agnostic data pipelines architecture that we've been using. 


#### Architecture:

##### Argo Workflows as the orchestrator
Argo Workflows is a container-native workflow engine for orchestrating parallel jobs on Kubernetes. Argo represents workflows as Dags (directed acyclic graphs) and each step of the workflow is a container. Since data pipelines can be easily modeled as workflow it is a great tool to use. Also, we have freedom to choose which programming language to design the connectors or the transformations, the only requirement is that each step of the pipeline should be containerized.

##### Dbt (data build tool) as the T in ELT. 
For the data transformations we found that dbt was our best choice. Dbt allows the transformations needed between the staging tables and the analytics tables. Dbt is SQL centric, so there isn't a need to learn another language. Also dbt has features that we wanted like testing and documentation generation and has native connections to Snowflake, BigQuery, Redshift and Postgres data warehouses. 

##### A sample data pipeline:

This project contains a reference implementation with a data pipeline to ingest UK covid19 data (https://api.coronavirus.data.gov.uk). 

The data pipeline consists in 3 steps:

**Ingestion**: Running a connector to read data from an api and save the data in a data ware house staging table.

**Transformation**: Transform the staged data into data warehouse models

**Data Quality Tests**: Tests that run against the transformed data to detect data quality issues


## Main concepts

### Connectors
Connectors are projects which ingest data from a source and write data into a staging table in a warehouse.
The covid19 connector is coded in clojure and it was developed using practices like tdd. 
Connectors should support backfilling with provided dates if needed.
The only requirement for connectors is being containerized applications.

### Data models
Data models are composed of a dbt project which contains the models that are created on each data pipeline. Also, it contains data tests, schema tests, and model unit tests.

### Data pipelines
Data Pipelines are composed of Argo Workflows which orchestrate the connectors and the data models. 
For each data pipeline, it could be created a workflow template defining the DAG that represents the pipeline, and a cron workflow to schedule the template.

## Run
The project uses a local kubernetes cluster to deploy Argo, a sample database, and an instance of Metabase which is user-friendly to see the data.
To run the project you need docker and jdk11 and the following requirements:

### Requirements (osx using homebrew):
```bash
brew install minikube
brew install kubectl
brew install argo
brew install helm
brew intall leiningen
brew install dbt
```
Apart from general development tools like docker and jdk11.

### Deploy locally:

```bash
minikube start
cd scripts
./deploy-argo.sh && ./deploy-db.sh && ./deploy-db-migrations-workflow.sh && ./deploy-covid19-workflow.sh && ./deploy-metabase.sh
```

## Walkthrough


### Argo Workflows 

During the deploy there are two workflows deployed on Argo.
 - Data Migration workflow creates the table needed for the example. The Migration is using a Clojure library (ragtime) to handle migrations.
 - Covid19uk Data Pileine is a cron workflow (runs every hour) that runs a template workflow that represents the pipeline. On the first run, it will take around 30m.

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

There is an instance of Metabase deployed with the example that allows to view the data. There is a pre-made
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

Portforward to db:
```bash
kubectl port-forward --namespace argo postgres-postgresql-0 5432:5432
```

#### k9s
Instead of using the portforwaring on terminal, you can use k9s if you are familiar.

```bash
brew install k9s
```

## Developing Environment

Note: to run the connector locally or dbt it's required to have a portforward to the database:

```bash
kubectl port-forward --namespace argo postgres-postgresql-0 5432:5432
```

##### Connector (connectors/covid19-uk-ingestions)

The project contains the connector for the covid19-uk api, also it has a migration feature which it's used to create the staging tables in databases.

###### Tests

```bash
lein do clean, test
```

###### Repl

```bash
lein do clean, repl
```

###### Migrations

Run migrations for test database used by dbt tests

```bash
lein with-profile +db-migrations repl
user=>(perform-db-migrations ["test"])
```

##### Dbt (data-models)

###### Run dbt

```bash
dbt run --profile test --profiles-dir resources
```

###### Testing db

```bash
dbt test --profile test --profiles-dir resources
```
