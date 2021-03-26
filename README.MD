## Language Agnostic Data Pipelines (Using Argo and Dbt)


Here is a complete use case that contains a data pipeline to ingest uk covid19 data (https://api.coronavirus.data.gov.uk). The Ingestion (inside workflow tasks) has tests as any other piece of software, and it was developed using practises like TDD. The Pipeline has data quality tests that run each time data is ingested, checking for null values on columns that should not be null, also for negative numbers of cases that should not happen.

It uses a local kubernetes cluster which launches Argo and a database where covid19 data is loaded and transformed. Also to see the data we are spinning up an instance of metabase connected to the same database.

### Requirements (osx using homebrew):
```bash
brew install minikube
brew install kubectl
brew install argo
brew install helm
brew intall leiningen
```
Apart from general development tools like docker and jdk11.

### Running locally:

```bash
minikube start covid19_cluster
cd dev
./deploy-argo.sh && ./deploy-db.sh && ./deploy-db-migrations-workflow.sh && ./deploy-covid19-workflow.sh && ./deploy-metabase.sh
```

#### Accessing Argo:
```bash
export ARGO_POD_NAME=$(kubectl get pods --namespace argo -l "app=argo-server" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward --namespace argo $ARGO_POD_NAME 2746:2746
```

> http://localhost:2746/workflows/argo

The job is scheduled to run every hour, but it can be triggered manually, just go into the cron option, and trigger the cron without parameters.

#### Accessing DB
```bash
 export POSTGRES_PASSWORD=$(kubectl get secret --namespace argo postgres-postgresql -o jsonpath="{.data.postgresql-password}" | base64 --decode)
 kubectl run postgres-postgresql-psql --rm --tty -i --restart='Never' --namespace argo --image docker.io/bitnami/postgresql:11.11.0-debian-10-r31 --env="PGPASSWORD=$POSTGRES_PASSWORD" --command -- psql --host postgres-postgresql -U covid19_user -d covid19_dev -p 5432
```

#### Accessing Metabase (login is devuser@somemail.com / metabase_password1.)
```bash
export METABASE_POD_NAME=$(kubectl get pods --namespace argo -l "app=metabase,release=metabase" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward --namespace argo $METABASE_POD_NAME 8080:3000
```

> http://localhost:8080
