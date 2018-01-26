# launch-chef-in-kubernetes

Launch Habitat Docker images of Chef Server as a Kubernetes Deployment

Note: This is definitely a work in progress and likely will change as I learn more about Kubernetes.

## Create a cluster

```bash
./cluster-up.sh
```

## Upload Docker images

```bash
# check if the images exist already first
gcloud container images list

./docker-image-upload.sh
```

## Create the POD

```bash
kubectl apply -f chef-server-pod.yml
watch kubectl get pods
```

## Operations

Watch logs
```bash
for c in postgresql elasticsearch oc-id bookshelf oc-bifrost oc-erchef chef-server-nginx; do kubectl logs $(kubectl get pods | grep -v NAME | awk '{print $1}') $c; done
```

Full logs for debugging
```bash
kubectl cluster-info dump
```

Get Habitat ring info

```bash
kubectl exec -it $(kubectl get pods | grep -v NAME | awk '{print $1}') -c chef-server-ctl -- hab pkg install core/jq-static -b
kubectl exec -it $(kubectl get pods | grep -v NAME | awk '{print $1}') -c chef-server-ctl -- curl localhost:9631/butterfly | jq
```

Get a shell on a container
```bash
kubectl exec -it $(kubectl get pods | grep -v NAME | awk '{print $1}') -c oc-erchef -- /bin/bash
```

Run Pedant tests
```bash
kubectl exec -it $(kubectl get pods | grep -v NAME | awk '{print $1}') -c chef-server-ctl -- chef-server-test
```

Create an admin User and Org
```bash
kubectl exec -it $(kubectl get pods | grep -v NAME | awk '{print $1}') -c chef-server-ctl -- chef-server-ctl user-create bob Bob Admin bob@local.host password
kubectl exec -it $(kubectl get pods | grep -v NAME | awk '{print $1}') -c chef-server-ctl -- chef-server-ctl org-create brewinc "Brew, Inc." --association_user bob
```

Delete the Deployment
```bash
kubectl delete deployment chef-server
```

## Cleanup

```bash
./cluster-destroy.sh
```
