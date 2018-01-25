#!/bin/bash

# gcloud container clusters create persistent-disk-tutorial --num-nodes=3
# gcloud container clusters get-credentials persistent-disk-tutorial

gcloud compute disks delete postgresql-disk
gcloud compute disks delete elasticsearch-disk
gcloud compute disks delete nginx-disk

kubectl delete deployment postgresql

#kubectl apply -f postgresqlv2.yml


