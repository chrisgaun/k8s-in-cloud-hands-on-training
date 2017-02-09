# Provisioning the Kubernetes cluster

## 1. Accessing the bootstrap node

To provision the Kubernetes cluster you need to SSH into the bootstrap-node

This can be done by executing:

```
$ ssh -i ssh/cluster.pem root@<bootstrap-node ip>
```

## 2. Downloading the necessary dependencies

The following command will download and install Kismatic and Kubectl

```
$ cd hands-on-with-kubernetes-workshop
$ make get-dependencies
```

## 3. Kismatic-cluster.yaml changes

Now update the `kismatic-cluster.yaml` in the root directory of the repo with the following changes:r

Add the IP address of Master1 to `ip`, `load_balanced_fqdn` and `load_balanced_short_name` below

```
master:
  expected_count: 1
  nodes:
  - host: master1
    ip:
  load_balanced_fqdn:
  load_balanced_short_name:
```

Update the remainder of the IP address in the `kismatic-cluster.yaml` under `etcd` and `worker`.

Once you have filled in the YAML file execute the following command:

```
$ make provision-cluster
```