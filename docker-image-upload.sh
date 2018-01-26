#!/bin/bash

export PROJECT_ID="$(gcloud config get-value project -q)"
#export PROJECT_ID=habitat-kubernetes-playland
export ORIGIN=chefservernonroot

for p in elasticsearch oc_erchef oc_bifrost chef-server-ctl bookshelf chef-server-nginx oc_id postgresql; do
  docker tag $ORIGIN/$p gcr.io/$PROJECT_ID/$p:latest
  gcloud docker -- push gcr.io/$PROJECT_ID/$p:latest
done
