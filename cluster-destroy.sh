#!/bin/bash

kubectl delete deployment chef-server

gcloud container clusters delete chef-server-cluster

gcloud compute disks delete postgresql-disk
gcloud compute disks delete elasticsearch-disk
gcloud compute disks delete nginx-disk
