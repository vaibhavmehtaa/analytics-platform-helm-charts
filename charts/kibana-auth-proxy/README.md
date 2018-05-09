# Kibana Auth Proxy

Authentication layer in front of kibana.


## Installing the Chart

**NOTE**: Remove the `--dry-run` option when you're happy with the command.

To install the chart:

```bash
helm install --dry-run mojanalytics/kibana-auth-proxy \
  --name cluster-logviewer \
  --namespace kube-system \
  --set auth.domain=$AUTH_DOMAIN \
  --set auth.clientID=$AUTH_CLIENT_ID \
  --set auth.clientSecret=$AUTH_CLIENT_SECRET \
  --set kibana.url=$KIBANA_URL \
  --set kibana.admin.username=$KIBANA_ADMIN_USERNAME \
  --set kibana.admin.password=$KIBANA_ADMIN_PASSWORD \
  --set kibana.user.username=$KIBANA_USER_USERNAME \
  --set kibana.user.password=$KIBANA_USER_PASSWORD \
  --set ingress.host=$INGRESS_HOST \
```

To upgrade the existing chart:

```bash
helm upgrade --dry-run --install cluster-logviewer mojanalytics/kibana-auth-proxy \
  --namespace kube-system \
  -f chart-env-config/ENV/kibana.yml
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
