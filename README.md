# Analytics Platform - Charts (Kubernetes packages)

This repository contains source YAML for Helm Charts, which define the Kubernetes software packages, that make up the Analytical Platform (AP). After the [AP infrastructure is set-up](https://github.com/ministryofjustice/analytics-platform-ops/blob/master/README.md) you can install the AP software using these charts.

# Charts installation

The latest master versions of these charts are kept up-to-date in the MOJ AP Helm repository:
http://moj-analytics-helm-repo.s3-website-eu-west-1.amazonaws.com/

You can install these charts from the Helm repository by adding the repo to your helm client, eg:

```sh
helm repo add mojanalytics http://moj-analytics-helm-repo.s3-website-eu-west-1.amazonaws.com/
helm repo update
# and then
helm install mojanalytics/$chart_name -f ...
```

OR for development you can clone this repo and specify the path to your local copy of the chart:

```sh
helm install charts/$chart_name -f ...
```

# A minimal set-up

To run a minimal version of AP, these are the essential charts to deploy:
* `init-platform`
* `nginx-ingress` (with release name `cluster-ingress`)
* `kube2iam` (official `stable/kube2iam` helm chart)
* `rbac`
* `cpanel`
* `aws-login`

# Full set-up
All of the above plus:
- [airflow](./charts/airflow-k8s)
- `cert-manager` (official `charts.jetstack.io/cert-manager` helm chart)
- [cert-manager-resources](./charts/cert-manager-resources)
- [cluster-autoscaler](./charts/cluster-autoscaler)
- `cluster-logging` (official `stable/fluentd` chart)
- [cluster-log-viewer](./charts/kibana-auth-proxy)
- `concourse` (official `stable/concourse`)
- [concourse-admin-team](./charts/concourse-admin-team)
- [idler](./charts/idler)
- [images-prepuller](./charts/images-prepuller)
- [kubernetes-dashboard](./charts/kubernetes-dashboard)
- `kuberos` (official `stable/kuberos`)
- [logstash-auth0](./charts/logstash)
- `metrics-server` (official `stable/metrics-server`)
- [network-policies](./charts/network-policies)
- [nfs-backup](./charts/nfs-backup)
- [org-pipeline-moj-analytical-services](./charts/concourse-org-pipeline)
- [pod-cleaner](./charts/pod-cleaner)
- [priority-classes](./charts/priority-classes)
- `prometheus-operator` (official `stable/prometheus-operator`)
- [promethues-resources](./charts/prometheus-resources)
- [restarter](./charts/restarter)
- [unidler](./charts/unidler)
- [webhook-dispatcher](./charts/webhook-dispatcher)
- [websocket-status](./charts/websocket-status)
