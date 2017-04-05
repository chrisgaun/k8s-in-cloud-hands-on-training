# Hands on with Kubernetes Workshops

The following repository will create you a Kubernetes cluster using the following:

1. A Google Cloud account:
  1. FREE TRIAL: $300 of Google Cloud for 12 months https://cloud.google.com/free/ 
  2. FREE KUBERNETES TIER: up to 5 nodes of Google Container Engine (GKE) are free. Note the underlining Google Compute Engine counts towards FREE TRIAL.    
2. Download Google SDK for Mac, Linux or Windows: https://cloud.google.com/sdk/downloads 
3. Clone of this repo to upload applications. 

## Course Documents

Join course Slack [here](http://54.242.94.98/). 

You will find the presentation, links, commands and group questions in the #k8satgoogle channel on Slack

## Create Infrastructure & Provision Cluster

A list of steps to build and provision the Kubernetes cluster can be found [here](docs/3-build-cluster.md)

## Using Kubernetes

The presenter will go through a list of demos during the workshop.

## Destroying everything once finished

To remove the droplets from Digital Ocean execute the following from your local machine.

```
$ cd terraform
$ terraform destroy --force
```
