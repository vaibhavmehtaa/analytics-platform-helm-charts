# RBAC Resources

Chart to deploy user and group [RBAC](https://kubernetes.io/docs/reference/access-authn-authz/rbac/) resources

### Installing and Upgrading a release

You may need to create these namespaces:
```
kubectl create ns airflow
kubectl create ns apps-prod
```
Now install the chart:
```
helm upgrade --dry-run --debug --install --namespace default rbac-chart charts/rbac
```

**NOTE**: Double-check output and remove `--dry-run` flag to install the chart for real.


## Configuration

| Parameter  | Description      | Default |
| ---------- | ---------------  | ------- |
| `team`     | Github team name as it appears in github |   ""  |
| `namespace` | Kubernetes namespace for namespaced scoped resources i.e. `Role`, `Rolebinding` | "" |
| `description` | Short description of RBAC resources use | "" |


## Contributing

- Add your `rbac` resources under the `./templates` directory keeping related resources in the same file where possible
- Optionally add a hash/map using the configuration parameters above to `values.yaml`. See [Example](#example)
- Append details of the resources you added to the [Configured Resources](#configured-resources) table below

Configured Resources
--------------
| Name/Team       | Type            | github org              | Scope                | Description                     |
| --------------- | --------------- | ----------              | -----                |  -----------                    |
| App-Support     | `Group`         | moj-analytical-services | Namespace: apps-prod |  Shiny application support. Read, edit resources except `configmaps` and `secrets`. Delete and exec `pods` |
| Cluster-Admins  | `Group`         | moj-analytical-services | Cluster Wide         |  Kubernetes Cluster Admins      |
| Airflow-support | `Group`         | moj-analytical-services | Namespace: airflow   |  Airflow job support. Read, edit resources except `configmaps` and `secrets`. Delete and exec `pods` |
| generic-support | `Group`         | moj-analytical-services | Cluster Wide         |  Read-only access to non-sensitive resources in all namespaces |
| kubelet-api     | `User`          | ""                      | Cluster Wide         |  Binding for builtin `kubelet-api` account. Auth between kubelet and API server |


#### Example

Add the `superdevs` github team values to be used by you template

```
teams:
  superDevs:
    name: superdevs
    namespace: default
    description: Only the best developers can join this team
```
