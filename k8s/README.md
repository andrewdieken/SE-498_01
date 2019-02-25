## Setting up

[traefik](https://github.com/helm/charts/tree/master/stable/traefik) is used as
the load balancer termination point for SSL certs. This allows us to use just
one LB from our cloud service provider, saving costs. Also, traefik implements
ACME so we can get certificates from LetsEncrypt.

You'll need helm to install the load balancer:

```
helm install --name lb --namespace kube-system --values lb-traefik-helm.yml
stable/traefik
# helm install --name name-of-deployment --namespace what-k8s-namespace --values
where-we-read-config path/to/helm/chart(leave stable/traefik to get the brew
installed charts)
```

Upgrading, after editing the values (`lb-traefik-helm.yml`):

```
helm upgrade -f lb-traefik-helm.yml lb stable/traefik
# then you may have to delete the lb-traefik pod. The above command updates the
ConfigMap but it does not seem like it makes traefik reload the ConfigMap
changes.
```
