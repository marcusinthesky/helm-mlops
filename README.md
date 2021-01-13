# Helm Mlflow Tracking
A helm mlflow tracking server for postgres and minio. 

# local testing
docker build . --tag mlflow:latest
docker run -it --rm  --network=host --env-file .env mlflow:latest


# example of minikube deployment
minikube start --addons=ingress --kubernetes-version v1.13.3

git clone <this repo>
cd <this repo>
helm install mlflow .

kubectl port-forward service/mlflow 5000:5000 # Will forward the mlflow service to localhost
