This repo contains a sample covid19 data pipeline using the following architecture: ...

Requirements:

 brew install k9s
 brew install minikube
 brew install kubectl
 brew install argo
 brew install helm

Running k8s cluster
> minikube start covid19_cluster

./deploy-argo.sh && ./deploy-db.sh && ./deploy-db-migrations-workflow.sh && ./deploy-covid19-workflow.sh   