# Unidler Helm Chart

The unidler is responsible for unidling the RStudio instances (currently).

## Installing the chart

```bash
$ helm upgrade --install --dry-run --debug unidler charts/unidler --namespace default -f chart-env-config/ENV/unidler.yml
```

**NOTE**: Remove `--dry-run` and adjust the values file path.
