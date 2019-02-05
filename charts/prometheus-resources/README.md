# Prometheus-Resources

Deploys resources related to the [Prometheus-Operator](https://github.com/helm/charts/tree/master/stable/prometheus-operator) helm chart

This chart:
- Adds our custom prometheus rules 
- Secures the [Prometheus](https://prometheus.services.dev.mojanalytics.xyz) and [AlertManager](https://alertmanager.services.dev.mojanalytics.xyz) front-ends with [auth-proxy](https://github.com/ministryofjustice/analytics-platform-auth-proxy) 

## Dependencies/Prerequisites 

- This Chart requires that the [Prometheus-Operator](https://github.com/helm/charts/tree/master/stable/prometheus-operator) helm chart be deployed first
- Helm version 2.10+
- Kubernetes 1.10+ with Beta APIs

## Installing and Deleting

**Note**:

There are some issues with race conditions pertaining to Custom Resource Definition hooks used by the [Prometheus-Operator](https://github.com/helm/charts/tree/master/stable/prometheus-operator) helm chart. 
This prevents the [Prometheus-Operator](https://github.com/helm/charts/tree/master/stable/prometheus-operator) helm chart from being installed directly (__with the helm cmd__) 
and indirectly (__with__ `requirements.yaml`).

There is a [fix](https://github.com/helm/helm/pull/5112). However, this is not expected until __Helm version 2.13.x__.

The steps to install a complete deployment are listed below.  


**Before Proceeding**
Ensure that the following value is set to `false`. (Relating to [bug](https://github.com/helm/helm/issues/4925) mentioned above)

```yaml
prometheusOperator:
  createCustomResource: false
```

### Install Commands

Install [Custom Resource Definitions](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/):
```bash
kubectl apply -f https://raw.githubusercontent.com/coreos/prometheus-operator/master/example/prometheus-operator-crd/alertmanager.crd.yaml
kubectl apply -f https://raw.githubusercontent.com/coreos/prometheus-operator/master/example/prometheus-operator-crd/prometheus.crd.yaml
kubectl apply -f https://raw.githubusercontent.com/coreos/prometheus-operator/master/example/prometheus-operator-crd/prometheusrule.crd.yaml
kubectl apply -f https://raw.githubusercontent.com/coreos/prometheus-operator/master/example/prometheus-operator-crd/servicemonitor.crd.yaml
```

Install [Prometheus-Operator](https://github.com/helm/charts/tree/master/stable/prometheus-operator) helm chart:
```bash
helm install --name prometheus-operator stable/prometheus-operator -f chart-env-config/<ENV>/stable-prometheus.yaml --namespace=monitoring --no-crd-hook
```
**Note** the `--no-crd-hook`


Install this chart:
```bash
helm upgrade prometheus-resources mojanalytics/prometheus-resources -f chart-env-config/<ENV>/stable-prometheus.yaml --namespace=monitoring --install
```

### Delete Commands

Delete this chart:
```bash
helm del prometheus-resources --purge
```

Delete [Prometheus-Operator](https://github.com/helm/charts/tree/master/stable/prometheus-operator) helm chart:
```bash
helm del prometheus-operator --purge
```

Delete [Custom Resource Definitions](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/):
```bash
kubectl delete crd servicemonitors.monitoring.coreos.com prometheusrules.monitoring.coreos.com prometheuses.monitoring.coreos.com alertmanagers.monitoring.coreos.com
```

### Updating Resources

Grafana Dashboards: 
- Add/Modify `json` templates in [config repo](https://github.com/ministryofjustice/analytics-platform-config)`/chart-env-config/<ENV>/stable_prometheus.yaml`
- `helm upgrade prometheus-resources mojanalytics/prometheus-resources -f chart-env-config/<ENV>/stable-prometheus.yaml --namespace=monitoring` 

Prometheus/Alerting Config:
- Add/Modify [values.yaml](./values.yaml) in this chart 
- `helm upgrade prometheus-resources mojanalytics/prometheus-resources -f chart-env-config/<ENV>/stable-prometheus.yaml --namespace=monitoring`


### Configuration

| Parameter  | Description      | Default |
| ---------- | ---------------  | ------- |
| `prometheusRules` | An array of Prometheus expressions on which alerts can be configured from. See: [Docs](https://prometheus.io/docs/prometheus/latest/configuration/recording_rules/) |  ""  |
| `mojDashboardFiles` | A hash of inline `json` documents located in [config repo](https://github.com/ministryofjustice/analytics-platform-config)`/chart-env-config/<ENV>/stable_prometheus.yaml` to add or configure Grafana dashboards | "" |
