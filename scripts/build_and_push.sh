#!/bin/bash
# Build & push to ECR
AWS_ACCOUNT_ID=$1
AWS_REGION=$2
SERVICE_NAME=$3

docker build -t $SERVICE_NAME ./\$SERVICE_NAME
docker tag $SERVICE_NAME:latest $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$SERVICE_NAME:latest
docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$SERVICE_NAME:latest
