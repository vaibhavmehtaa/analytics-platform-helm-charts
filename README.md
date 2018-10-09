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
* `nginx-ingress`
* `cpanel`
* `cpfrontend`
* `kube2iam`
