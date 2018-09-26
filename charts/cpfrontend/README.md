# Control Panel frontend Helm Chart

Installing this chart will deploy the Analytical Platform Control Panel frontend.
The Control Panel allows the creation and management of users, apps and
data sources on the platform.


## Installing the Chart

To install the chart:

```bash
helm install mojanalytics/cpfrontend \
  --name cpfrontend-$BRANCH_NAME \
  --set ServicesDomain=$SERVICES_DOMAIN \
  --set Frontend.Image.Tag=$DOCKER_IMAGE_TAG \
  --set Frontend.Environment.ENV=$ENV \
  --set Frontend.Environment.AUTH0_DOMAIN=$AUTH0_DOMAIN \
  --set Frontend.Environment.AUTH0_CLIENT_ID=$AUTH0_CLIENT_ID \
  --set Frontend.Environment.AUTH0_CLIENT_SECRET=$AUTH0_CLIENT_SECRET \
  --set Frontend.Environment.SENTRY_DSN=$SENTRY_DSN \
  --set Frontend.Environment.TOOLS_DOMAIN=$TOOLS_DOMAIN \
```

The instance will be available at https://cpfrontend-$BRANCH_NAME.$SERVICES_DOMAIN


## Configuration

| Parameter  | Description     | Default |
| ---------- | --------------- | ------- |
| `Frontend.Environment.API_URL` | URL where the API is running | `""` |
| `Frontend.Environment.AUTH0_CLIENT_ID` | Auth0 client ID | `""` |
| `Frontend.Environment.AUTH0_CLIENT_SECRET` | Auth0 client ID | `""` |
| `Frontend.Environment.AUTH0_DOMAIN` | Auth0 client domain | `""` |
| `Frontend.Environment.ENV` | Environment name, e.g. `"dev"` | `""` |
| `Frontend.Environment.SENTRY_DSN` | Credentials needed to report errors to Sentry | `""` |
| `Frontend.Environment.TOOLS_DOMAIN` | Domain under which tools are deployed, e.g. `tools.example.com` | `""` |
| `ServicesDomain` | domain under which the UI will be available, e.g. `services.example.com` | `""` |
| `ingress.addTlsBlock` | Adds tls block to ingress resource. This needs to be `true` if you're using `nginx` as ingress-controller but it may need to be `false` for others (e.g. `traefik`) | `true` |
