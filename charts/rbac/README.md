# RBAC Resources

Chart to deploy user and group [RBAC](https://kubernetes.io/docs/reference/access-authn-authz/rbac/) resources

### Installing and Upgrading a release

```
helm upgrade rbac-chart analytics-platform-helm-charts/charts/rbac --install
```

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
| Name/Team     | Type            | github org              | Description               |
| ----------    | --------------- | ----------              | -----------               |
| App-Support   | `Group`         | moj-analytical-services | Shiny application support |
| Cluster-Admins| `Group`         | moj-analytical-services | Kubernetes Cluster Admins |


#### Example

Add the `superdevs` github team values to be used by you template 

```
teams:
  superDevs:
    name: superdevs
    namespace: default
    description: Only the best developers can join this team
```
