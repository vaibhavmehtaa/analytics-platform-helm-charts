# Jupyter-Lab Helm Chart


## Installing the Chart

To install an jupyter instance for the user specified in the Username variable (Github username):

```bash
$ helm install charts/jupyter-lab -f chart-env-config/ENV/jupyter.yml --set aws.iamRole=ENV_user_USERNAME --set Username=USERNAME --namespace user-USERNAME --name=USERNAME-jupyter
```

The instance will be available at <https://USERNAME-jupyter-lab.tools.ENV.mojanalytics.xyz>.

**NOTE**: Change the environment config file to deploy in a different environment
          (the URL will change accordingly)


## Upgrading the Chart

To upgrade a user jupyter chart:
```bash
$ helm upgrade USERNAME-jupyter charts/jupyter-lab -f chart-env-config/ENV/jupyter.yml --set Username=USERNAME
```


## Configuration

### Auth0 application

In Auth0 you need to create an Application:

1. Login to https://manage.auth0.com/ and select the tenant for your environment
2. In the side-bar click "Applications"
3. Click "Create Application"
      * Name: Jupyter Lab
      * Application Type: Regular Web Applications
4. Click "Save"
5. Click "Settings"
      * Allowed Callback URLs: `http://localhost:3000/callback, https://*-jupyter-lab.tools.$env.$domain/callback`
      (replace the $variables)
6. Click "Save changes"

Record the Client ID and Client Secret values - you'll use them in the configuration below.

### jupyter.yml

Listing only the required params here. See `analytics-platform-helm-charts/charts/jupyter-lab/values.yaml` for more
details.

| Parameter  | Description     | Default |
| ---------- | --------------- | ------- |
| `authProxy.auth0.clientId` | Auth0 'Jupyter Lab' application's client ID | `""`    |
| `authProxy.auth0.clientSecret` | Auth0 'Jupyter Lab' application's client secret | `""`    |
| `authProxy.auth0.domain` | Auth0 tenant domain e.g. `dev-analytics-moj.eu.auth0.com` | `""`    |
| `authProxy.cookieSecret` | Random UUID `$ uuidgen` | `""` |
