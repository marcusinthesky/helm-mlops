# Defining base image
FROM python:3.8.2-slim

# Installing packages from PyPi
RUN pip install mlflow==1.13.1 && \
    pip install psycopg2-binary==2.8.6 && \
    pip install boto3==1.16.53

ENV MLFLOW_S3_ENDPOINT_URL=minio.default.svc.cluster.local:9000
ENV AWS_ACCESS_KEY_ID=secret
ENV AWS_SECRET_ACCESS_KEY=secret
ENV BACKEND_STORE_URI=s3://mlruns
ENV DIALECT=postgresql
ENV DRIVER=psycopg2
ENV USERNAME=postgres
ENV PASSWORD=postgres
ENV HOST=localhost
ENV PORT=5432
ENV DATABASE=postgres

# Defining start up command
EXPOSE 5000
ENTRYPOINT mlflow server --host 0.0.0.0 --port 5000 --default-artifact-root=$BACKEND_STORE_URI --backend-store-uri=${DIALECT}+${DRIVER}://${USERNAME}:${PASSWORD}@${HOST}:${PORT}/${DATABASE}
