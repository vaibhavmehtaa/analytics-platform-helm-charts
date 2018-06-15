# Airflow Helm Chart

Run Airflow on Kubernetes, tasks are executed as new pods.


## Install/Upgrade the Chart

Run:

```bash
$ helm upgrade --install airflow charts/airflow-k8s --namespace airflow -f chart-env-config/ENV/airflow-k8s.yml
```

Airflow will be available at <https://airflow.tools.ENV.mojanalytics.xyz>.

**NOTE**: Change the environment config file to deploy in a different environment
          (the URL will change accordingly)


## Configuration

| Parameter           | Description     | Default.    |
| ------------------- | --------------- | ----------- |
| `airflow.loadExamples` | Load example DAGs | `false`|
| `airflow.tasksNamespace` | Namespace where tasks' pods will be created | `"airflow-tasks"`|
| `postgres.host`     | (required)      | `""`        |
| `postgres.port`     |                 | `5432`      |
| `postgres.user`     | (required)      | `"airflow"` |
| `postgres.password` | (required)      | `""`        |
| `postgres.db`       | (required)      | `"airflow"` |
