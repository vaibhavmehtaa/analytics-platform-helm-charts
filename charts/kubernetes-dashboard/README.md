# Kubernetes Dashboard

Chart representation of [kubernetes-dashboard](https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml) with read only by default

## Install/Upgrade the Chart

```bash
$ helm upgrade --dry-run --install --debug kubernetes-dashboard --namespace=kube-system charts/kubernetes-dashboard -f analytics-platform-config/chart-env-config/{ENV}/kubernetes-dashboard.yml
```


**NOTE**: Change the environment config file to deploy in a different environment
          (the URL will change accordingly)

**NOTE**: Remove `-dry-run` once you're happy with the output.


## Delete the Chart

```bash
$ helm del --purge kubernetes-dashboard
```
