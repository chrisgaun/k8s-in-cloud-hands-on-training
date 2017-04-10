# Rolling Deployment Demo Workflow

These steps are to be executed from your local machine!

## 1. Navigate to the repository directory on your machine.  

```
$ cd /[LOCATION YOU CLONED THIS REPO]/GKE-hands-on-training
```

## 2. Execute the Kubernetes deployment first

```
$ kubectl apply -f examples/rolling-deployment/deployment-v1.0.yaml
```

## 3. Display the pods

```
kubectl get deployments k8s-workshop-site
```
Decribe the deployment

```
kubectl describe deployments k8s-workshop-site
```
See all the pods running on the cluster

```
$ kubectl get pods -o wide
```

## 4. Create a Services with an external endpoint that we can access

```
kubectl expose deployment k8s-workshop-site --type=LoadBalancer --name=k8s-workshop-site-dev
```
Find the port and external IP

```
$ kubectl get services k8s-workshop-site-dev
```

You should now be seeing:

```
root@bootstrap-node:~/hands-on-with-kubernetes-workshop# kubectl get services
NAME                CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
k8s-workshop-site   172.17.149.128   <nodes>       80:32233/TCP   13s
kubernetes          172.17.0.1       <none>        443/TCP        7m
```

## 5. Obtain the IP addresses of the worker node

To obtain the worker node Ip address browse...

## 6. Browse to version 1.0 of the website

Now from your browser browse to `http://<worker ip>:nodePort`

In our instance it would be `http://<worker ip>:32233`

Note: Port `32233` is shown as being the NodePort used after we executed `kubectl get services` above.

You should now see "version 1.0" displayed on the webpage.

## 7. Deploy version 1.1 of the website

Execute the following command from the bootstrap node:

```
$ kubectl apply -f examples/rolling-deployment/deployment-v1.1.yaml
```

Now if we check the pods currently running we should see v1.1 of the application is coming online:

```
root@bootstrap-node:~/hands-on-with-kubernetes-workshop# kubectl get pods
NAME                                 READY     STATUS              RESTARTS   AGE
k8s-workshop-site-1412125313-c9clv   1/1       Running             0          7m
k8s-workshop-site-1412125313-dlhsh   1/1       Terminating         0          7m
k8s-workshop-site-1412125313-lxtx3   1/1       Running             0          7m
k8s-workshop-site-1641828995-6z6xm   0/1       ContainerCreating   0          3s
k8s-workshop-site-1641828995-jjgtc   0/1       ContainerCreating   0          3s
```

## 7. Browse to version 1.1 of the website

If we browse to `http://<worker ip>:32233` again.

Now keep refreshing the browser you will see `version: 1.0` and `version: 1.1`

Eventually you will only be able to see `version: 1.1`.

That means the rolling deployment has been successfully completed.

## 8. Delete the demo

Finally execute the following command to tidy away the demo:

```
$ kubectl delete -f examples/rolling-deployment/service.yaml
$ kubectl delete -f examples/rolling-deployment/deployment-v1.1.yaml
```
