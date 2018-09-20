## Istio


### What is Istio
[Istio](https://istio.io) is an open platform-independent service mesh that provides traffic
management, policy enforcement, and telemetry collection.

Istio has many components and features but initially we're only using it to
direct traffic from the internet into right pod (Ingress resources).


### Installation
This repository does *not* include the helm chart for Istio - we're using the
official helm chart which is part of the Istio release (see below).

This repository includes instructions on how to install Istio in kubernetes
but for up-to-date documentation refer to the [Istio's webside](https://istio.io/docs/setup/kubernetes/helm-install/).


#### Download Istio release
Istio keeps the official helm chart inside its release.

To [download it](https://istio.io/docs/setup/kubernetes/download-release/):

```bash
curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.0.2 sh
```

cd into the folder you just downloaded.


#### Install custom resource definitions (CRDs) if necessary

- Check helm version `$ helm version`
- If version is prior to `2.10.0` you'll also need to install custom resource
  definitions (CRDs) manually as follow:
  `$ kubectl apply -f install/kubernetes/helm/istio/templates/crds.yaml`


#### Install helm chart

Configuration for the helm chart is in the usual [config repository](https://github.com/ministryofjustice/analytics-platform-config)

Specifically you'll have to pass the values when installing the helm chart:

```bash
$ helm install install/kubernetes/helm/istio --name istio --namespace istio-system -f $PATH_TO_CONFIG/chart-env-config/$ENV/istio.yml
```


### Uninstall

```bash
$ helm delete --purge istio
```

You may also want to delete CRDs as follow:

```bash
$ kubectl delete -f install/kubernetes/helm/istio/templates/crds.yaml -n istio-system
```
