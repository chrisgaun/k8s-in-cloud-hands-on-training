# Build the Kubernetes cluster

## 1. Sign into Google Cloud 

Sign into your Google Cloud account (need Google SDK [here](https://cloud.google.com/sdk/))

The following command will open up window to authenticate using your email associated with the account. 

```
$ gcloud auth login 
```

## 2. Create Infrastructure

Sing into the 

Note: You will need to paste in the Digital Ocean Token during the Terraform execution.

```
$ gcloud container --project "apprenda-project-one" clusters create "k8strainingcluster" --zone "us-west1-a" --machine-type "n1-standard-1" --image-type "GCI" --disk-size "100" --scopes "https://www.googleapis.com/auth/compute","https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --num-nodes "3" --network "default" --no-enable-cloud-logging --no-enable-cloud-monitoring --enable-autoupgrade
```

To apply the changes execute the following commands:

```
$ terraform apply
```

## 2. Provisioning the Kubernetes cluster using Kismatic

To provision the cluster follow the steps [here](4-accessing-the-bootstrap-node.md)
