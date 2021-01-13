# Helm Mlflow Tracking
A helm mlflow tracking server for postgres and minio. 

minikube start --addons=ingress --kubernetes-version v1.13.3

helm repo add bitnami https://charts.bitnami.com/bitnami
helm install minio bitnami/minio
helm install postgres bitnami/postgresql

docker build . --tag mlflow:latest
docker run -it --rm  --network=host --env-file .env mlflow:latest

helm install mlflow .
