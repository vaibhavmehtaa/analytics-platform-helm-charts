# Cert-Manager Resources

[Cert-Manager's](https://github.com/jetstack/cert-manager) [custom resources (CRDS)](https://coreos.com/blog/custom-resource-kubernetes-v17) to request tls certificates from [Let's Encrypt](https://letsencrypt.org/)


### Dependency

This chart requires that you first deploy the [Cert-Manager's](https://github.com/jetstack/cert-manager) [operators](https://coreos.com/blog/custom-resource-kubernetes-v17) prior to installing 

See official [chart](https://hub.helm.sh/charts/jetstack/cert-manager) for up to date deployment steps

##### Add Chart Repo
```bash
helm repo add jetstack https://charts.jetstack.io
```

##### Install Custom Resource Definitions
```bash
kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.11/deploy/manifests/00-crds.yaml
```

##### Install Cert-Manager Control Plane

__Note__:  It's generally a good idea to update the upstream helm repo before installing the control plane
```bash
helm repo update
```

```bash
helm upgrade cert-manager --namespace cert-manager jetstack/cert-manager --values analytics-platform-config/chart-env-config/__ENV__/cert-manager-resources.yaml --install
``` 

### Installing/Upgrading chart

```bash
helm upgrade cert-manager-resources mojanalytics/cert-manager-resources --values analytics-platform-config/chart-env-config/__ENV__/cert-manager-resources.yaml --install
```

After deploying the chart, observe events and progress of the [DNS01 validation](https://docs.certifytheweb.com/docs/dns-validation.html) and [Let's Encrypt](https://letsencrypt.org/) certificate request by tailing the `cert-manager` pod logs

```bash
kubectl logs cert-manager-XXXXXXX --namespace cert-manager -f
```

You can also monitor the `certificate` events for less verbose progress logs

```bash
kubectl describe certificates cert-manager-resources --namespace default
```

Once completed the resulting TLS certificate can be found in the default `namespace`

```bash
kubectl get secret cert-manager-resources-tls --namespace default
```

### Configuration


| Parameter  | Description      | Default |
| ---------- | ---------------  | ------- |
| `issuer.acme.server` | The acme server/endpoint cert-manager requests certificates from |   `https://acme-staging-v02.api.letsencrypt.org/directory`  |
| `issuer.acme.email` | Domain owner's email | "" |
| `issuer.acme.solvers.dnszone` | The name of the hosted zone to perform DNS01 challenges in |  |
| `issuer.acme.dns01.route53.region` | Jury's out on this one? | `eu-west-1` |
| `issuer.acme.dns01.route53.hostedzoneid` | ZoneID for DNS01 challenge | "" |
| `issuer.acme.dns01.route53.role` | IAM role that the cert-manager `pod` will assume when performing DNS01 challenge | ""
| `cert.commonname` | CommonName for certificate i.e. `*.yourenv.yourdomain.com` | "" |
| `cert.dnsnames` | An array of dns records you want your tls certificate to provide tls for `*.yourenv.yourdomain.com, *.sub.yourenv.yourdomain.com` | "" |

Further information can be found in the [API reference](https://cert-manager.readthedocs.io/en/latest/reference/api-docs/index.html)

### Remove Cert Manager


##### Remove This Chart

__Note__: Does not remove TLS cert `secret` mentioned above
```bash
helm del --purge cert-manager-resources
```

##### Remove Dependencies

```bash
helm del --purge cert-manager
```

```bash
kubectl delete -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.11/deploy/manifests/00-crds.yaml
```
