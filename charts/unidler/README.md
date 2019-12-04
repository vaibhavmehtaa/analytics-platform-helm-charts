# Unidler Helm Chart

The [unidler](https://github.com/ministryofjustice/analytics-platform-go-unidler) is responsible for unidling the RStudio instances (currently).

## Installing the chart

```bash
$ helm upgrade --install --dry-run --debug unidler charts/unidler --namespace default -f chart-env-config/ENV/unidler.yml
```

**NOTE**: Remove `--dry-run` and adjust the values file path.


## Configuration
The `unidleKeyLabel` value can be used to specify which label will be used
by the unidler to find the tool's resources to update when unidling.

This defaults to `"host"` for retro-compatibility with `dev`/`alpha` clusters.

For new clusters set to `unidle-key`.
