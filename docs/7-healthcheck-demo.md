# Healthcheck Demo Workflow

These steps are to be executed from the boostrap node itself!

## 1. Navigate to the repository directory on the server

```
$ cd /root/hands-on-with-kubernetes-workshop
```

## 2. Execute the Kubernetes service and healthy deployment

```
$ kubectl apply -f examples/healthcheck/service.yaml
$ kubectl apply -f examples/healthcheck/healthy-deployment.yaml
```

## 3. Display the pods running which are serving our application

```
root@bootstrap-node:~/hands-on-with-kubernetes-workshop# kubectl get pods -o wide
NAME                                 READY     STATUS    RESTARTS   AGE       IP               NODE
k8s-workshop-site-1982099918-00k1p   1/1       Running   0          45s       172.16.235.206   worker1
k8s-workshop-site-1982099918-2nk7m   1/1       Running   0          45s       172.16.235.207   worker1
k8s-workshop-site-1982099918-kxdlc   1/1       Running   0          45s       172.16.235.205   worker1
```

## 4. Browse to the Kubernetes Dashboard

To obtain the Master node IP address browse [here](https://cloud.digitalocean.com/tags/hands-on-kubernetes-workshop?i=81db1d)

Now browse to `https://<master ip>:6443/ui`. E.g. `https://178.62.115.83:6443/ui`

The username and password are as follows:

Username: admin
Password: DeSletankiwom5784

Now click on `pods` from the left hand navigation menu.

You should see three healthy pods (with green ticks next to them)

## 5. Obtain the port on the worker node

```
$ kubectl get services
```

You should now be seeing:

```
root@bootstrap-node:~/hands-on-with-kubernetes-workshop# kubectl get services
NAME                CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
k8s-workshop-site   172.17.149.128   <nodes>       80:32233/TCP   13s
kubernetes          172.17.0.1       <none>        443/TCP        7m
```

## 6. Obtain the IP addresses of the worker node in Digital Ocean

To obtain the worker node Ip address browse [here](https://cloud.digitalocean.com/tags/hands-on-kubernetes-workshop?i=81db1d)

## 7. Browse to version 1.0 of the website

Now from your browser browse to `http://<worker ip>:nodePort`

In our instance it would be `http://<worker ip>:32233`

Note: Port `32233` is shown as being the NodePort used after we executed `kubectl get services` above.

You should now see "version 1.0" displayed on the webpage.

## 8. Now deploy the broken deployment

```
$ kubectl apply -f examples/healthcheck/broken-deployment.yaml
```

## 9. Refresh the Kubernetes dashboard

Now refresh the Kubernetes dashboard displaying the pods a few times

You should start to see the warning message `Liveness probe failed: HTTP probe failed with statuscode: 404`

## 10. Refresh the browse displaying the website

You should still see "version 1.0" displayed on the webpage.

Kubernetes healthchecks have failed so version 1.1 of the website isn't healthy so no traffic is being sent to it.

## 11. Delete the demo

Finally execute the following command to tidy away the demo:

```
$ kubectl delete -f examples/healthcheck/service.yaml
$ kubectl delete -f examples/healthcheck/broken-deployment.yaml
```