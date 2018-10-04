# Kibana Auth Proxy

Authentication layer in front of kibana.


## Installing the Chart

**NOTE**: Remove the `--dry-run` option when you're happy with the command.

To install the chart:

```bash
helm upgrade --dry-run --install cluster-logviewer mojanalytics/kibana-auth-proxy \
  --namespace kube-system \
  -f chart-env-config/ENV/kibana-auth-proxy.yml
```

The proxy will be available at the host specified via `ingress.host` value.


## Configuration

| Parameter  | Description     | Default |
| ---------- | --------------- | ------- |
| `auth.domain` | Auth0 client domain | `""` |
| `auth.clientID` | Auth0 client ID | `""` |
| `auth.clientSecret` | Auth0 client secret | `""` |
| `kibana.url` | URL where Kibaba is | `"http://localhost/"` |
| `kibana.admin.username` | Kibana admin username | `""` |
| `kibana.admin.password` | Kibana admin password | `""` |
| `kibana.user.username` | Kibana non-admin username | `""` |
| `kibana.user.password` | Kibana non-admin password | `""` |
| `ingress.host` | Host where the proxy will be available | `"example.com"` |
| `ingress.addTlsBlock` | Whether to add the tls block to the ingress resource | `true` |
