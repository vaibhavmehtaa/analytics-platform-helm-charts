# Pod Cleaner

Deletes old pods in `Succeeded`/`Failed` phase:

> Succeeded: All Containers in the Pod have terminated in success, and will not be restarted.

> Failed: All Containers in the Pod have terminated, and at least one Container has terminated in failure. That is, the Container either exited with non-zero status or was terminated by the system.

See kubernetes documentation on [pods phases](https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#pod-phase).


## Installing the chart

```bash
$ helm upgrade --dry-run --debug --install pod-cleaner charts/pod-cleaner --namespace airflow
```

Install the helm chart in the namespace where you want the cron job
to delete old pods.

**NOTE**: Remove `--dry-run` and adjust the values file path.


## Configuration

| Parameter | Description | Default |
| --------- | ----------- | ------- |
| `deleteFailedAfter` | Number of days after which a pod in `Failed` phase should be deleted | `10` |
| `deleteSucceededAfter` | Number of days after which a pod in `Succeeded` phase should be deleted | `3` |
| `schedule` | When to run the job that delete the old pods | `"0 5 * * *"` - every day at 5am, see https://kubernetes.io/docs/user-guide/cron-jobs/#schedule |


## Caveats
Pods which are failing but that have `RestartPolicy=Always` will not be
deleted because from kubernetes perspective these are still in `Running`
phase.


## Technical details
The cron job will start two containers which will run the `pod_cleaner.sh`
script. One script will delete the old pods in `Succeeded` phase, the other
will delete the ones in `Failed` phase.

The script will get the pods in the specified phase and then use `awk`/`date`
to determine if the pod is old enough to qualify for deletion.

**NOTE** The script relies on GNU `date` and its `--date` argument to generate
the date used for the comparison. This means that it would not work on
distributions which ship with a non-GNU version of `date` out of the box,
e.g. Alpine (unless you explicitly install GNU date of course).
