This repo contains a sample covid19 data pipeline using the following architecture: ...

Requirements:

 brew install k9s
 brew install minikube
 brew install kubectl
 brew install argo
 brew install helm

Running k8s cluster
> minikube start covid19_cluster
> cd dev
> ./deploy-argo.sh && ./deploy-db.sh && ./deploy-db-migrations-workflow.sh && ./deploy-covid19-workflow.sh && ./deploy-metabase.sh

To portfoward and to explore the k9s cluster we recommend the use of k9s. 

Portfoward to Argo to see the job running details.
export ARGO_POD_NAME=$(kubectl get pods --namespace argo -l "app=argo-server" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward --namespace argo $ARGO_POD_NAME 2746:2746

> http://localhost:2746/workflows/argo

Porforward to Metabase to see the data (login is devuser@somemail.com / metabase_password1.)

export METABASE_POD_NAME=$(kubectl get pods --namespace argo -l "app=metabase,release=metabase" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward --namespace argo $METABASE_POD_NAME 8080:3000

> http://localhost:8080