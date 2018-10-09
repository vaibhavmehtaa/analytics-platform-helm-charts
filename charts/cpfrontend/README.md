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

### Auth0 application

In Auth0 you need to create an Application:

1. Login to https://manage.auth0.com/ and select the tenant for your environment
2. In the side-bar click "Applications"
3. Click "Create Application"
      * Name: kubectl-oidc
      * Application Type: Regular Web Applications
4. Click "Save"
5. Click "Settings" tab
      * Allowed Callback URLs: `http://localhost:3000/callback, https://cpanel-master.services.$env.$domain/callback`
      (replace the $variables)
      * Allowed Web Origins: `http://localhost:3000, https://cpanel-master.services.$env.$domain` (replace the $variables)
      * Allowed Logout URLs: `http://localhost:3000, https://cpanel-master.services.$env.$domain` (replace the $variables)
6. Click "Save changes"
7. Click "Connections" tab
8. Switch OFF "Database" and "Google"
9. In the side-bar click "Connections" then "Social"
10. If GitHub is not already ON:
     1. Click GitHub to set it up
     2. Follow: [Connect your app to GitHub](https://auth0.com/docs/connections/social/github)
        Make sure you create the connection in your organization, not your own account. Complete the Client ID and Client Secret on GitHub.
     3. Check these boxes:
        * Email address
        * read:user
        * read:org
     4. Click "Save"
     5. Click "Applications" tab and switch on all applications that need login, including: auth0-authz, AWS, RStudio, Grafana, Control Panel, kubectl-oidc, Jupyter Lab, Concourse, Airflow, auth0-logs-to-logstash.
     6. Click "Save" and "X" to close the dialog.

Record the Client ID and Client Secret values - you'll use them in the configuration below.

### cpfrontend.yml

| Parameter  | Description     | Default |
| ---------- | --------------- | ------- |
| `Frontend.Environment.API_URL` | URL where the API is running | `http://cpanel-master-cpanel` |
| `Frontend.Environment.AUTH0_CLIENT_ID` | Auth0 'kubectl-oidc' application's client ID | `""` |
| `Frontend.Environment.AUTH0_CLIENT_SECRET` | Auth0 'kubectl-oidc' application's client secret | `""` |
| `Frontend.Environment.AUTH0_DOMAIN` | Auth0 tenant domain e.g. `dev-analytics-moj.eu.auth0.com` | `""` |
| `Frontend.Environment.AWS_LOGIN_URL` | Auth0's 'AWS' Application SAML Protocol URL (find it under the AWS application's Advanced Settings, Endpoints) | `""` |
| `Frontend.Environment.ENV` | Environment name, e.g. `"dev"` | `""` |
| `Frontend.Environment.SENTRY_DSN` | Credentials needed to report errors to Sentry | `""` |
| `Frontend.Environment.TOOLS_DOMAIN` | Domain under which tools are deployed, e.g. `tools.example.com` | `""` |
| `ServicesDomain` | domain under which the UI will be available, e.g. `services.example.com` | `""` |
| `ingress.addTlsBlock` | Adds tls block to ingress resource. This needs to be `true` if you're using `nginx` as ingress-controller but it may need to be `false` for others (e.g. `traefik`) | `true` |
