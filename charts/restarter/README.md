# Restarter Helm Chart

API to restart applications within a certain namespace (given their host).

See deployed API: https://github.com/ministryofjustice/analytics-platform-restarter

## Installing the chart

```bash
$ helm upgrade --install --dry-run --debug restarter charts/restarter --namespace apps-prod
```

**NOTE**: Remove `--dry-run` and adjust the values file path.
