# Accessing the bootstrap node

To provision the Kubernetes cluster you need to SSH into the bootstrap-node

## 1. Windows

During the installation of the prerequisites [here](windows-prerequisities.md) Git Bash for Windows would have been installed.

Open a Git Bash terminal and browse to the location of the repository of your local machine.

Once you are in the directory execute the following command:

```
$ ssh -i ssh/cluster.pem root@<bootstrap-node ip>
```

## 2. Linux

This can be done by executing the following command:

```
$ ssh -i ssh/cluster.pem root@<bootstrap-node ip>
```

To provision the cluster click [here](provision-cluster.md)