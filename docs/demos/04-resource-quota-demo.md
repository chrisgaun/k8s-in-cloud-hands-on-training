# Resource Quota Demo Workflow

These steps are to be executed from the boostrap node itself!

## 1. Navigate to the repository directory on the server

```
$ cd /root/hands-on-with-kubernetes-workshop
```

## 2. Execute the application service and deployment

```
$ kubectl apply -f examples/resource-quotas/service.yaml
$ kubectl apply -f examples/resource-quotas/deployment.yaml
```

## 3. Locate the pods

```
$ kubectl get pods -o wide
```

You should now see:

```
NAME                                   READY     STATUS    RESTARTS   AGE       IP               NODE
resource-quota-demo-4067652524-01jh5   1/1       Running   0          41s       172.16.235.216   worker1
resource-quota-demo-4067652524-72xxh   1/1       Running   0          41s       172.16.235.217   worker1
resource-quota-demo-4067652524-wnhgn   1/1       Running   0          41s       172.16.235.218   worker1
```

## 4. Obtain the name of the deployment

```
$ kubectl get deployments
```

```
NAME                  DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
resource-quota-demo   3         3         3            3           1m
```

## 5. Scale the deployment to something silly

```
$ kubectl scale deployment resource-quota-demo --replicas=10
```

## 6. Check the number of pods in the Kubernetes Dashboard

To obtain the Master node IP address browse [here](https://cloud.digitalocean.com/tags/hands-on-kubernetes-workshop)

Now browse to `https://<master ip>:6443/ui`. E.g. `https://178.62.115.83:6443/ui`

The username and password are as follows:

Username: admin
Password: DeSletankiwom5784

Now click on `pods` from the left hand navigation menu.

You should see eight healthy pods (with green ticks next to them)

However you should see 2 displaying the following:

```
pod (resource-quota-demo-4067652524-jxlrw) failed to fit in any node fit failure summary on nodes : Insufficient cpu (1), Insufficient memory (1)
```

## 7. Check the status of the deployment

We can also see the information by describing the deployment using:

```
$ kubectl describe deployment resource-quota-demo
```

You will see the section: `Replicas: 10 updated | 10 total | 8 available | 2 unavailable`

## 8. Scale down the replica count

```
$ kubectl scale deployment resource-quota-demo --replicas=3
```

## 9. Delete the demo

Finally execute the following command to tidy away the demo:

```
$ kubectl delete -f examples/resource-quotas/service.yaml
$ kubectl delete -f examples/resource-quotas/deployment.yaml
```