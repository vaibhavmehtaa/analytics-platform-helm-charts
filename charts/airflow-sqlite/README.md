# Airflow Helm Chart

Run Airflow on demand in kubernetes user namespace.

It looks for DAGs in the users home directory under /home/{user}/airflow/dags. Tasks are executed as new k8s pods if you use KubernetesPodOperator.

Users can test dags here by adding them to their home directory.

## Install/Upgrade the Chart

This chart is run by the control panel so shouldn't need to be run manually other than testing.

Run:

```bash
$ helm upgrade --dry-run --debug --install \
{username}-airflow-sqlite \
charts/airflow-sqlite \
--namespace {user-namespace} \
-f chart-env-config/ENV/airflow-sqlite.yml \
--set Username={username} \
--set aws.iamRole={iam-user-role} \
--set toolsDomain={base-domain} \
--set authProxy.auth0_domain={auth0domain}

```
