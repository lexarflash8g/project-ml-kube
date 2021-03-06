#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
export dockerpath="lexarflash8g/flaskapp"
# Step 2
# Run the Docker Hub container with kubernetes
kubectl run flaskapp --image=$dockerpath | tee kubernetes_out.txt

#wait for pod to become available
sleep 30
# Step 3:
# List kubernetes pods
kubectl get pods | tee -a kubernetes_out.txt
# Step 4:
# Forward the container port to a host

kubectl port-forward flaskapp 8000:80 | tee -a kubernetes_out.txt

sh make-prediction.sh | tee -a kubernetes_out.txt
