# Idler

Cronjob which idles specified deployments in the cluster, saving resources when
they are unused.

The idler runs every night at 10pm and scales down RStudio deployments to 0
replicas, unless the deployment has an average CPU usage of greater than 10%
over the last minute (ie: it is active).

## Installing/upgrading the Chart


```bash
$ helm upgrade --dry-run --debug --install idler charts/idler --namespace default
```

**NOTE**: Remove `--dry-run` to actually install/upgrade once you're
happy with the output.


## Configuration

| Parameter | Description | Default |
| --------- | ----------- | ------- |
| `cpuActivityThreshold` | Percentage of CPU usage to consider an "active" deployment which should not be idled | `10` |
| `labelSelector` | Kubernetes label selector for deployments to consider for idling | `mojanalytics.xyz/idleable=true` |
| `logLevel` | Log level. See [Python 3 log levels](https://docs.python.org/3/library/logging.html#levels) for valid values | `DEBUG` |
| `schedule` | Cron format string defining time and frequency of runs | `0 22 * * *` (every day at 22:00) |
