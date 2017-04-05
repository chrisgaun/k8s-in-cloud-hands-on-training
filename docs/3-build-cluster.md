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

## 3.Connect with cluster

Install kuebctl

```
gcloud components install kubectl
```

Get credentials 

```
gcloud auth application-default login
```

Configure kubectl

```
gcloud container clusters get-credentials k8strainingcluster --zone us-west1-a --project apprenda-project-one
```

Start proxy to connect to the Kubernetes cluster

```
kubectl proxy
```

Open the Dashboard in browswer with the following IP address

```
127.0.0.1:8001
```

## 4. - Close the Dashboard

To continue to use the CLI, you need to close the Dashboard. 
