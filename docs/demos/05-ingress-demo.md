# Ingress Demo Workflow

These steps are to be executed from the boostrap node itself!

## 1. Navigate to the repository directory on the server

```
$ cd /root/hands-on-with-kubernetes-workshop
```

## 2. Execute the application service, deployment & ingress defintions

```
$ kubectl apply -f examples/ingress
```

## 3. Browse via the NodePort

```
$ kubectl get svc
```

You should see the following:

```
NAME                   CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
k8s-workshop-ingress   172.17.150.221   <nodes>       80:32691/TCP   7s
kubernetes             172.17.0.1       <none>        443/TCP        1h
```

To obtain the worker node Ip address browse [here](https://cloud.digitalocean.com/tags/hands-on-kubernetes-workshop)

Now from your browser browse to `http://<worker ip>:nodePort`

In our instance it would be `http://<worker ip>:32691`

Note: Port `32691` is shown as being the NodePort used after we executed `kubectl get services` above.

You should now see "version 1.0" displayed on the webpage.

## 4. Obtain the Ingress IP address

To obtain the ingress node Ip address browse [here](https://cloud.digitalocean.com/tags/hands-on-kubernetes-workshop)

## 5. Setup your hostfile

Execute the following:

```
$ nano \etc\hosts
```

Add the following line to the file

```
<ingress node ip> k8sworkshop.com
```

An example would be:

```
178.62.114.175 k8sworkshop.com
```

## 6. Now browse via the domain name

From the command line execute: `curl http://k8sworkshop.com`

You should see the following:

```
<html>
   <head>
      <title>Kubernetes Workshop</title>
   </head>
   <body>
      <h1>Kubernetes Workshop</h1>
      Welcome to the <a href="httphttp://kubernetes.io">kubernetes</a> workshop!
   </body>
   <footer>
      <p>Created by: Steven Wade</p>
      <p>Contact information: <a href="mailto:steven@stevenwade.co.uk">steven@stevenwade.co.uk</a>.</p>
      <p>Version: 1.0</p>
   </footer>
```

## 9. Delete the demo

Finally execute the following command to tidy away the demo:

```
$ kubectl delete -f examples/ingress
```