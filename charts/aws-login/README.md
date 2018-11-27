# aws-login Helm Chart

Installing the chart will deploy the AWS Federated Login service:
https://github.com/ministryofjustice/analytics-platform-aws-federated-login

Includes Redis for session storage to allow for multiple replicas.

## Installing the Chart

To install the chart:

```bash
helm install mojanalytics/aws-login \
  --name aws-login \
  -f ../chart-env-config/dev/aws-login.yml \
  --set image.tag=v1.1.3
```

The instance will be available at `https://aws.<ServicesDomain>`


## Configuration

### Auth0 application

In Auth0 you need to create an Application:

1. Login to https://manage.auth0.com/ and select the tenant for your environment
2. In the side-bar click "Applications"
3. Click "Create Application"
      * Name: AWS
      * Application Type: Regular Web Applications
4. Click "Save"
5. Click "Settings"
      * Allowed Callback URLs: `http://localhost:3000/callback, http://localhost:3001/callback, https://aws.services.$env.$domain/callback`
      * Allowed Web Origins: `http://localhost:3000, http://localhost:3001, https://aws.services.$env.$domain`
      (replace the $variables)
6. Click "Save changes"

Record the Client ID and Client Secret values - you'll use them in the configuration below.

### aws-login.yml

| Parameter  | Description     | Default |
| ---------- | --------------- | ------- |
| `replicaCount` | Number of replicas - suggest having 2 | 1 |
| `redis.password` | Random UUID `$ uuidgen` | |
| `environment.AUTH0_DOMAIN` | Auth0 tenant domain e.g. `dev-analytics-moj.eu.auth0.com` | `""` |
| `environment.AUTH0_CLIENT_ID` | Auth0 'AWS' application's client ID | `""` |
| `environment.AUTH0_CLIENT_SECRET` | Auth0 'AWS' application's client secret | `""` |
| `environment.AUTH0_CALLBACK_URL` | Auth0 'AWS' application's callback e.g. `https://aws.services.dev.mojanalytics.xyz/callback` | `""` |
| `environment.COOKIE_SECRET` | Random UUID `$ uuidgen` | |
| `environment.AWS_ACCOUNT_ID` | e.g. `593291632749` | |
| `environment.ENV` | The environment name e.g. `dev` or `alpha` | |
| `ingress.enabled` | Set this to `true` | `false` |
| `ingress.host` | e.g. `aws.services.dev.mojanalytics.xyz` | `chart-example.local` |
