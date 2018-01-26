#!/bin/bash

gcloud container clusters create chef-server-cluster --num-nodes=3 --machine-type n1-standard-8
gcloud container clusters get-credentials chef-server-cluster
kubectl cluster-info

gcloud compute disks create --size 200GB postgresql-disk
gcloud compute disks create --size 200GB elasticsearch-disk
gcloud compute disks create --size 200GB nginx-disk
