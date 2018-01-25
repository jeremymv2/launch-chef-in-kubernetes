#!/bin/bash

gcloud container clusters create persistent-disk-tutorial --num-nodes=3
gcloud container clusters get-credentials persistent-disk-tutorial

#gcloud compute disks create --size 200GB postgresql-disk
#gcloud compute disks create --size 200GB elasticsearch-disk
#gcloud compute disks create --size 200GB nginx-disk

kubectl apply -f postgresqlv2.yml


