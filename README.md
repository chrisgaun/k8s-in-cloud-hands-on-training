# Hands on with Kubernetes Workshops

The following repository will create you a Kubernetes cluster using the following:

1. Digital Ocean for the underlying infrastructure
2. Terraform to create the infrastructure
3. [Kismatic Enterprise Toolkit](https://github.com/apprenda/kismatic) for provisioning our Kubernetes cluster

## Prerequisities

A list of prerequisities can be found [here](docs/prerequisities.md)

## Create Infrastructure & Provision Cluster

A list of steps to build and provision the Kubernetes cluster can be found [here](docs/build-cluster.md)

## Using Kubernetes

The presenter will go through a list of `kubectl` commands during the workshop.

## Destroying everything once finished.

To clean up your local machine and remove the droplets from Digital Ocean execute `make destroy`