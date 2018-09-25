# Charts installation

After the cluster is set up you can install the following charts
by running these commands from the root of the project (change `dev` to your environment name).

**[Helm](https://github.com/kubernetes/helm)** is a tool for managing Kubernetes charts. Charts are packages of pre-configured Kubernetes resources.

1. Install helm (see link for instructions)
2. Run `$ helm init --service-account helm`

# How to contribute?

1. Create a branch off master
2. Make the changes in the helm charts
3. Bump the version in Chart.yaml for each modified chart
4. [Test in dev](#how-to-test)
5. Push the changes


# How to test?

1. Set the `kubectl` context to the dev cluster
2. Read the Chart's README or see below for specific installation instructions

# A minimal set-up

To run a minimal version of AP, these are the essential charts to deploy:
* `init-platform`
* `nginx-ingress`
* `cpanel`
* `cpfrontend`
* `kube2iam`

## nginx-ingress

Necessary to access the services from outside the cluster.

```bash
$ helm upgrade cluster-ingress charts/nginx-ingress -f ../analytics-platform-config/chart-env-config/dev/nginx-ingress.yml --namespace default --install
```

### Domain SSL certificate

Each new environment needs an SSL certificate for its domain name, specified in this chart's config under key: `controller.service.annotations."service.beta.kubernetes.io/aws-load-balancer-ssl-cert"`

To get provide this, go to AWS console's Certificate Manager.

1. Click "Request a certificate"
2. Select "Request a public certificate" and click "Request a certificate"
3. Add these domain names to the certificate (replacing "dev.mojanalytics.xyz" with your environment's domain name):
    * dev.mojanalytics.xyz
    * *.dev.mojanalytics.xyz
    * *.tools.dev.mojanalytics.xyz
    * *.services.dev.mojanalytics.xyz
    * *.apps.dev.mojanalytics.xyz
4. Choose "DNS validation" and click "Review" and "Confirm and Request"
5. Under each of the domain names, click the little expand arrow and click "Create record in Route 53".
6. In the Certificate Manager's list, find your domain name. Click the little arrow to expand the details below and under Details note down the ARN value. Put this into your environments' `nginx-ingress.yml` e.g.:

`service.beta.kubernetes.io/aws-load-balancer-ssl-cert: "arn:aws:acm:eu-west-1:111111111111:certificate/111111111-1111-1111-1111-1111111111"`

7. It will take 30 minutes or so to validate the SSL cert and actually create the certificate. Once it has complete you can install the helm chart. Before the certificate is created you'll see this error:

    ```
    $ kubectl describe svc cluster-ingress-nginx-ingress-controller
      Warning  CreatingLoadBalancerFailed  33s (x4 over 10m)   service-controller  (combined from similar events): Error creating load balancer (will retry): Failed to ensure load balancer for service default/cluster-ingress-nginx-ingress-controller: CertificateNotFound: Server Certificate not found for the key: arn:aws:acm:eu-west-1:111111111111:certificate/111111111-1111-1111-1111-1111111111
    ```

## cpanel

Control panel app

```bash
$ helm install charts/cpanel -f ../analytics-platform-config/chart-env-config/dev/cpanel.yml --name cpanel-master
```

## node-exporter

Exports metrics about the kubernetes nodes.

```bash
$ helm install charts/node-exporter --namespace kube-system --name node-metrics
```


## heapster

Exports metrics about the kubernetes nodes (used by k8s when describing pods, etc...)

```bash
$ helm install charts/heapster --namespace kube-system --name heapster
```


## kube-dashboard

Kubernetes dashboard.

Available at http://dashboard.services.dev.mojanalytics.xyz

#### Read Only

At __login__ screen select __Skip__ to view dashboard in Read-Only mode.  

#### Admin 

At __login__ screen select idToken and paste the appropriate idToken from your `KUBECONFIG` file. 

Alternatively 

Get an idToken with the [Auth0-Kube-App](https://quay.io/repository/mojanalytics/auth0-golang-kube-app)

```bash
$ kubectl apply -f ../analytics-platform-config/chart-env-config/dev/kube-dashboard.yml
```


## kube2iam

Responsible for attaching IAM roles to pods with the `iam.amazonaws.com/role`
annotation.


```bash
$ helm install charts/kube2iam -f ../analytics-platform-config/chart-env-config/dev/kube2iam.yml --namespace default --name kube2iam
```


## fluentd

Reads the logs and sends them to ElasticSearch/Kibana.

```bash
$ helm install charts/fluentd -f ../analytics-platform-config/chart-env-config/dev/fluentd.yml --namespace kube-system --name cluster-logging
```


## kibana-auth-proxy

Grant (authorised) access to the Kibana to view the logs. Kibana is hosted with ElasticSearch in AWS.

Available at https://kibana.services.dev.mojanalytics.xyz/_plugin/kibana

```bash
$ helm install charts/kibana-auth-proxy -f ../analytics-platform-config/chart-env-config/dev/kibana.yml --namespace kube-system --name cluster-logviewer
```


## prometheus

Collects metrics, monitor systems and can send alerts.

```bash
$ helm repo add coreos https://s3-eu-west-1.amazonaws.com/coreos-charts/stable/
$ helm install coreos/prometheus-operator --name prometheus-operator --namespace monitoring
$ helm install coreos/kube-prometheus --name kube-prometheus --namespace monitoring -f analytics-platform-config/chart-env-config/{env}/prometheus.yml
```
#### Note
`prometheus.yml` file can be found [here](https://github.com/ministryofjustice/analytics-platform-config/tree/master/chart-env-config)

## grafana

Analytics and monitoring interface.

Available at https://grafana.services.dev.mojanalytics.xyz

```bash
$ helm install stable/grafana -f ../analytics-platform-config/chart-env-config/dev/grafana.yml --namespace kube-system --name cluster-monitoring
```


## init-platform

Creates k8s resources related to the users homes (AWS EFS).

```bash
$ helm install charts/init-platform -f ../analytics-platform-config/chart-env-config/dev/init-platform.yml --namespace default --name init-platform
```

## Concourse

CI/CD platform for automated jobs, builds and deployments

[Chart](https://github.com/kubernetes/charts/tree/master/stable/concourse)

Available at https://concourse.services.alpha.mojanalytics.xyz

```bash
$ helm upgrade --install --recreate-pods --namespace default concourse stable/concourse --values analytics-platform-config/chart-env-config/alpha/concourse.yaml
```
