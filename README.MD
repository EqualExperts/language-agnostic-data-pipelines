## Language Agnostic Data Pipelines (Using Argo and Dbt)


This is a complete use case that contains a data pipeline to ingest uk covid19 data (https://api.coronavirus.data.gov.uk). 
The Ingestion (inside workflow tasks) is a clojure project and it was developed using practises like TDD. 
The Pipeline has data quality tests that run each time data is ingested, checking for null values on columns that should not be null, also for negative numbers of cases that should not happen.

It uses a local kubernetes cluster which launches Argo and a database where covid19 data is loaded and transformed. Also to see the data we are spinning up an instance of metabase connected to the same database.

The intent of the repo is to share this approach to make data pipelines with the simplest data pipeline that can be easily changed and adapted. 
There wasn't any effort to make complex analytics transformations or to handle a large amount of data. 

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
cd dev
./deploy-argo.sh && ./deploy-db.sh && ./deploy-db-migrations-workflow.sh && ./deploy-covid19-workflow.sh && ./deploy-metabase.sh
```

### Walkthrough


#### Argo 

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


#### Metabase (login is devuser@somemail.com / metabase_password1.)

There is an instance of metabase deployed with the example that allows to view the data. There is a pre-made
question created to show covid19 Data (just click in browse all items on the homepage)

```bash
export METABASE_POD_NAME=$(kubectl get pods --namespace argo -l "app=metabase,release=metabase" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward --namespace argo $METABASE_POD_NAME 8080:3000
```

> http://localhost:8080


#### Accessing DB

To access database directly:

```bash
 export POSTGRES_PASSWORD=$(kubectl get secret --namespace argo postgres-postgresql -o jsonpath="{.data.postgresql-password}" | base64 --decode)
 kubectl run postgres-postgresql-psql --rm --tty -i --restart='Never' --namespace argo --image docker.io/bitnami/postgresql:11.11.0-debian-10-r31 --env="PGPASSWORD=$POSTGRES_PASSWORD" --command -- psql --host postgres-postgresql -U covid19_user -d covid19_dev -p 5432
```

