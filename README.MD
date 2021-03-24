## This repo contains a sample covid19 data pipeline using the following architecture: ...

### Requirements (osx using homebrew):
```bash
brew install minikube
brew install kubectl
brew install argo
brew install helm
```
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

#### Accessing Metabase (login is devuser@somemail.com / metabase_password1.)
```bash
export METABASE_POD_NAME=$(kubectl get pods --namespace argo -l "app=metabase,release=metabase" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward --namespace argo $METABASE_POD_NAME 8080:3000
```
> http://localhost:8080
