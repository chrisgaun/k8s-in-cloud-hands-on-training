# Hands on with Kubernetes Workshops

The following repository will create you a Kubernetes cluster using the following:

1. Digital Ocean for the underlying infrastructure
2. Terraform to create the infrastructure
3. [Kismatic Enterprise Toolkit](https://github.com/apprenda/kismatic) for provisioning our Kubernetes cluster

## Prerequisities

A list of prerequisities for Windows can be found [here](docs/windows-prerequisities.md)

A list of prerequisities for Mac can be found [here](docs/mac-prerequisities.md)

## Create Infrastructure & Provision Cluster

A list of steps to build and provision the Kubernetes cluster can be found [here](docs/accessing-the-bootstrap-node.md)

## Using Kubernetes

The presenter will go through a list of `kubectl` commands during the workshop.

## Destroying everything once finished.

To remove the droplets from Digital Ocean execute the from your local machine.

```
$ cd terraform
$ terraform destroy --force
```