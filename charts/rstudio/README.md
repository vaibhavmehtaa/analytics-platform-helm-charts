# RStudio Helm Chart


## Installing the Chart

To install an rstudio instance for the user specified in the username variable (Github username):

```bash
$ helm install charts/rstudio -f chart-env-config/ENV/rstudio.yml --set username=USERNAME --namespace user-USERNAME --name=USERNAME-rstudio
```

The instance will be available in <https://USERNAME-rstudio.tools.ENV.mojanalytics.xyz>.

**NOTE**: Change the environment config file to deploy in a different environment
          (the URL will change accordingly)


## Upgrading the Chart

To upgrade a user rstudio chart:
```bash
$ helm upgrade USERNAME-rstudio charts/rstudio -f chart-env-config/ENV/rstudio.yml --set username=USERNAME
```


## Configuration

### Auth0 application

In Auth0 you need to create an Application:

1. Login to https://manage.auth0.com/ and select the tenant for your environment
2. In the side-bar click "Applications"
3. Click "Create Application"
      * Name: RStudio
      * Application Type: Regular Web Applications
4. Click "Save"
5. Click "Settings"
      * Allowed Callback URLs: `http://localhost:3000/callback, https://*-rstudio.tools.$env.$domain/callback`
      (replace the $variables)
      * Allowed Logout URLs: `https://*-rstudio.tools.$env.$domain` (replace the $variables)
      * Allowed Origins (CORS): `https://*-rstudio.tools.$env.$domain` (replace the $variables)
6. Click "Save changes"

Record the Client ID and Client Secret values - you'll use them in the configuration below.

### cpfrontend.yml

Listing only the required params here. See `/chart-env-config/` for more
details.

| Parameter  | Description     | Default |
| ---------- | --------------- | ------- |
| `authProxy.auth0.clientId` | Auth0 'RStudio' application's client ID | `""`    |
| `authProxy.auth0.clientSecret` | Auth0 'RStudio' application's client secret | `""`    |
| `authProxy.auth0.domain` | Auth0 tenant domain e.g. `dev-analytics-moj.eu.auth0.com` | `""`    |
| `authProxy.cookieSecret` | Random UUID `$ uuidgen` | `""` |
| `rstudio.secureCookieKey` | Random UUID `$ uuidgen` | `""` |
