# Cert-Manager Resources

[Cert-Manager's](https://github.com/jetstack/cert-manager) [custom resources (CRDS)](https://coreos.com/blog/custom-resource-kubernetes-v17) to request tls certificates from [Let's Encrypt](https://letsencrypt.org/)


### Dependency

This chart requires that you first deploy the [Cert-Manager's](https://github.com/jetstack/cert-manager) [operators](https://coreos.com/blog/custom-resource-kubernetes-v17) prior to installing 

To do so, install the [cert-manager](https://github.com/helm/charts/tree/master/stable/cert-manager) chart

```
helm upgrade cert-manager stable/cert-manager --install --namespace=kube-system --version=v0.5.0
``` 

### Installing/Upgrading chart

```
helm upgrade $ENV-prod-wildcard-cert mojanalytics/cert-manager-resources --namespace=kube-system -f ../analytics-platform-config/chart-env-config/$ENV/cert-manager-resources.yaml --install
```

After deploying the chart, observe the progress of the [DNS01 validation](https://docs.certifytheweb.com/docs/dns-validation.html) and [Let's Encrypt](https://letsencrypt.org/) certificate request by monitoring the `certificate` events

```
kubectl describe cert dev-prod-wildcard-cert --namespace=kube-system
```

### Configuration


| Parameter  | Description      | Default |
| ---------- | ---------------  | ------- |
| `issuer.acme.server` | The acme server/endpoint cert-manager requests certificates from |   `https://acme-v02.api.letsencrypt.org/directory`  |
| `issuer.acme.email` | Domain owner's email | "" |
| `issuer.dns01.provider.name` | Arbitrary name of the DNS01 challenge | `route53` |
| `issuer.dns01.provider.route53.region` | Jury's out on this one? | `eu-west-1` |
| `issuer.dns01.provider.route53.hostedzoneid` | ZoneID for DNS01 challenge | "" |
| `cert.commonname` | CommonName for certificate i.e. `*.yourenv.yourdomain.com` | "" |
| `cert.dnsnames` | An array of dns records you want your tls certificate to provide tls for `*.yourenv.yourdomain.com, *.sub.yourenv.yourdomain.com` | "" |
| `cert.acme.config.domains` | An array of domains your `dnsnames` reside in to be verified during DNS01 challenge. This requires a suitable issuer DNS01 provider. See [Issuer tutorial](https://cert-manager.readthedocs.io/en/latest/tutorials/acme/dns-validation.html) | "" |

Further information can be found in the [API reference](https://cert-manager.readthedocs.io/en/latest/reference/api-docs/index.html)

