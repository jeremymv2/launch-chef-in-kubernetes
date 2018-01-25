#!/bin/bash

# postgresql
gcloud compute disks create chef_server_postgresql --zone  us-central1-b --image [IMAGE] --type [TYPE]
