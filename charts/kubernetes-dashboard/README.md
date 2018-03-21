# Kubernetes Dashboard

Chart representation of [kubernetes-dashboard](https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml) with read only by default

## Installing the Chart

```bash
$ helm install --name=kubernetes-dashboard analytics-platform-helm-charts/charts/kubernetes-dashboard --namespace=kube-system -f analytics-platform-config/chart-env-config/{ENV}/kube-dashboard.yml
```

**NOTE**: Change the environment config file to deploy in a different environment
          (the URL will change accordingly)


## Upgrade the Chart

```bash
$ helm upgrade kubernetes-dashboard analytics-platform-helm-charts/charts/kubernetes-dashboard -f analytics-platform-config/chart-env-config/{ENV}/kube-dashboard.yml
```

## Delete the Chart

```bash
$ helm del --purge kubernetes-dashboard
```
