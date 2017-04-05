# Hands on with Kubernetes Workshops

The following repository will create you a Kubernetes cluster using the following:

1. Sign up for a Google Cloud account:
    1. FREE TRIAL: $300 of Google Cloud for 12 months https://cloud.google.com/free/ 
    2. FREE KUBERNETES TIER: up to 5 nodes of Google Container Engine (GKE) are free. Note the underlining Google Compute Engine counts towards the $300 from the FREE TRIAL.    
2. Download Google SDK for Mac, Linux or Windows: https://cloud.google.com/sdk/downloads 
3. Clone of this repo to upload applications. 

## Course Documents

Join the course's Slack [here](http://54.242.94.98/). 

You will find the presentation, links, commands and group questions pinned in the #k8satgoogle channel on Slack [here](https://kismatic.slack.com/messages/C4V9PELKG/)

## Create Infrastructure & Provision Cluster

A list of steps to build and provision the Kubernetes cluster can be found [here](docs/3-build-cluster.md)

## Using Kubernetes

The presenter will go through a list of demos during the workshop.

## Destroying Cluster After Training

Congrats on finishing the hands on introducting to Kubernetes!

To remove the Kubernetes cluster and underlining infrastructure execute the following from your local machine.

```
$ gcloud container clusters delete [NAME OF CLUSTER] --zone "[ZONE]"
```
If you used the standard command in this workshop to start the cluster than copy and paste the following:

```
$ gcloud container clusters delete k8strainingcluster --zone "us-west1-a"
```
You will still have roughly $300 in Google Cloud credits you can use to test out Kubernetes more. 
