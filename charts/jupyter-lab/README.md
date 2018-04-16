# Jupyter-Lab Helm Chart


## Installing the Chart

To install an jupyter instance for the user specified in the Username variable (Github username):

```bash
$ helm install charts/jupyter-lab -f chart-env-config/ENV/jupyter.yml --set Username=USERNAME --namespace user-USERNAME --name=USERNAME-jupyter
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

Listing only the required params here. See `/chart-env-config/` for more
details.

| Parameter  | Description     | Default |
| ---------- | --------------- | ------- |
| `Username` | Github username | ``      |
